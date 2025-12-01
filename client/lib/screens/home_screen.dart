import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../widgets/quote_card.dart';
import '../widgets/blackhole_background.dart';
import '../services/quote_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  Quote? _quote;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _loadRandomQuote();
  }

  Future<void> _loadRandomQuote() async {
    try {
      final quote = await QuoteService.getTodaysQuote();
      setState(() {
        _quote = quote;
        _isLoading = false;
      });
      _animationController.forward();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load quote: $e'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
      // Print error for debugging
      print('Error loading quote: $e');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blackhole background
          const BlackholeBackground(),
          // Content - centered to match blackhole
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : _quote != null
                      ? FadeTransition(
                          opacity: _fadeAnimation,
                          child: QuoteCard(quote: _quote!),
                        )
                      : const Text(
                          'No quote available',
                          style: TextStyle(color: Colors.white),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
