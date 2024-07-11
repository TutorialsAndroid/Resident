import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Utility {
  static void logMessage(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  static void openPage(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}