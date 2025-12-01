import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceService {
  /// Get a unique device ID that persists across app uninstalls
  /// Uses Android ID (persists across uninstalls) or iOS identifierForVendor
  static Future<String> getDeviceId() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      String deviceId;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        // Android ID persists across uninstalls (unless factory reset)
        // It's a 64-bit number, convert to string
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        // identifierForVendor persists across uninstalls of this app
        // (until all apps from vendor are uninstalled)
        deviceId = iosInfo.identifierForVendor ?? 'ios-unknown';
      } else {
        // Fallback for other platforms - use a combination that's stable
        // Note: This won't persist across uninstalls on desktop/web
        deviceId = 'fallback-${DateTime.now().millisecondsSinceEpoch}';
      }

      // Ensure we have a valid ID
      if (deviceId.isEmpty || deviceId == 'unknown') {
        throw Exception('Unable to get device ID');
      }

      return deviceId;
    } catch (e) {
      // Last resort fallback - but this won't persist across uninstalls
      throw Exception('Failed to get device ID: $e');
    }
  }
}

