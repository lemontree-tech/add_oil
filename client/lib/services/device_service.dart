import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceService {
  static const _deviceIdKey = 'device_id';

  /// Get or create a unique device ID
  static Future<String> getDeviceId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Try to get existing device ID
      final existingId = prefs.getString(_deviceIdKey);
      if (existingId != null && existingId.isNotEmpty) {
        return existingId;
      }

      // Generate new device ID based on device info
      final deviceInfo = DeviceInfoPlugin();
      String deviceSignature;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceSignature = '${androidInfo.id}-${androidInfo.model}-${androidInfo.brand}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceSignature = '${iosInfo.identifierForVendor ?? 'unknown'}-${iosInfo.model}';
      } else {
        // Fallback for other platforms
        deviceSignature = DateTime.now().millisecondsSinceEpoch.toString();
      }

      // Generate UUID-like string from device signature
      final deviceId = _generateIdFromSignature(deviceSignature);

      // Store it
      await prefs.setString(_deviceIdKey, deviceId);

      return deviceId;
    } catch (e) {
      // Fallback if anything fails - generate a simple ID
      final prefs = await SharedPreferences.getInstance();
      final fallbackId = DateTime.now().millisecondsSinceEpoch.toString();
      await prefs.setString(_deviceIdKey, fallbackId);
      return fallbackId;
    }
  }

  /// Generate a stable ID from device signature
  static String _generateIdFromSignature(String signature) {
    // Simple hash-like function to create a stable ID
    int hash = 0;
    for (int i = 0; i < signature.length; i++) {
      hash = ((hash << 5) - hash) + signature.codeUnitAt(i);
      hash = hash & hash; // Convert to 32-bit integer
    }
    return hash.abs().toString();
  }
}

