
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Pluggin {
  static const MethodChannel _channel = MethodChannel('pluggin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> get defaultGreeting async {
    final String? version = await _channel.invokeMethod('getDefaultGreeting');
    return version;
  }

  static Future<String?> get icon async {
    final String? version = await _channel.invokeMethod('getIcon');
    return version;
  }

  static Future<String?> greetingForUser(String name) async {
    final String? version = await _channel.invokeMethod('getDefaultGreetingUser', {'name', name});
    return version;
  }
}
