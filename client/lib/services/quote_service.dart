import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/quote.dart';

class QuoteService {
  static List<Quote>? _cachedQuotes;
  static final Random _random = Random();

  /// Load quotes from the JSON asset file
  static Future<List<Quote>> loadQuotes() async {
    if (_cachedQuotes != null) {
      return _cachedQuotes!;
    }

    try {
      final String jsonString = await rootBundle.loadString('assets/quotes.json');
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      
      _cachedQuotes = jsonList.map((json) => Quote.fromJson(json)).toList();
      return _cachedQuotes!;
    } catch (e) {
      throw Exception('Failed to load quotes: $e');
    }
  }

  /// Get a random quote from the loaded quotes
  static Future<Quote> getRandomQuote() async {
    final quotes = await loadQuotes();
    if (quotes.isEmpty) {
      throw Exception('No quotes available');
    }
    return quotes[_random.nextInt(quotes.length)];
  }
}

