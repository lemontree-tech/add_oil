import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 40.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.green.shade100.withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 50,
            offset: const Offset(0, 15),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 100,
            offset: const Offset(0, 0),
            spreadRadius: 30,
          ),
          BoxShadow(
            color: Colors.blue.shade200.withOpacity(0.3),
            blurRadius: 120,
            offset: const Offset(0, 0),
            spreadRadius: 40,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.text,
            style: TextStyle(
              fontSize: 21,
              height: 1.9,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quote.source,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Icon(
                      index < quote.luckyLevel
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: index < quote.luckyLevel
                          ? Colors.amber.shade300
                          : Colors.grey[200],
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

