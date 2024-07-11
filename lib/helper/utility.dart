import 'package:flutter/foundation.dart';

class Utility {
  static void logMessage(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}