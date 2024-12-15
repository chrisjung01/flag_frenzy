import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomLogger {
  void log(String message) {
    if (kDebugMode) {
      print('[Flag Frenzy]: $message');
    }
  }
}

final customLoggerProvider = Provider<CustomLogger>((ref) {
  return CustomLogger();
});
