import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import '../models/quote.dart';
import 'device_service.dart';

class QuoteService {
  static List<Quote>? _cachedQuotes;

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

  /// Get today's date as YYYY-MM-DD string
  static String _getTodayDateString() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  /// Calculate hash from device ID and date
  static int _calculateQuoteIndex(String deviceId, String date) {
    final input = '$deviceId-$date';
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    
    // Take first 8 hex characters and convert to integer
    final hexString = digest.toString().substring(0, 8);
    final hashValue = int.parse(hexString, radix: 16);
    
    return hashValue;
  }

  /// Get today's quote based on device ID and date
  static Future<Quote> getTodaysQuote() async {
    try {
      final quotes = await loadQuotes();
      if (quotes.isEmpty) {
        throw Exception('No quotes available');
      }

      // Get device ID and today's date
      final deviceId = await DeviceService.getDeviceId();
      final date = _getTodayDateString();

      // Calculate hash and get quote index
      final hashValue = _calculateQuoteIndex(deviceId, date);
      // Use modulo 50 since we have 50 quotes
      final index = hashValue % 50;

      // Ensure index is within bounds
      if (index < 0 || index >= quotes.length) {
        throw Exception('Invalid quote index: $index (quotes.length: ${quotes.length})');
      }

      return quotes[index];
    } catch (e) {
      throw Exception('Failed to get today\'s quote: $e');
    }
  }
}

