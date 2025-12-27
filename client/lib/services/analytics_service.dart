import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Log app open
  static Future<void> logAppOpen() async {
    try {
      await _analytics.logAppOpen();
      if (kDebugMode) {
        debugPrint('✅ Analytics: app_open event sent');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Analytics error: $e');
      }
    }
  }

  /// Log quote viewed
  static Future<void> logQuoteViewed({
    required int quoteId,
    required String source,
    required int luckyLevel,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'quote_viewed',
        parameters: {
          'quote_id': quoteId,
          'source': source,
          'lucky_level': luckyLevel,
        },
      );
      if (kDebugMode) {
        debugPrint('✅ Analytics: quote_viewed event sent: quote_id=$quoteId');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Analytics error: $e');
      }
    }
  }

  /// Log screen view
  static Future<void> logScreenView(String screenName) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
      if (kDebugMode) {
        debugPrint('✅ Analytics: screen_view event sent: $screenName');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Analytics error: $e');
      }
    }
  }
}

