
import 'dart:async';

import 'package:flutter/services.dart';

class FacebookAndGoogleSignin {
  static const MethodChannel _channel = MethodChannel('facebook_and_google_signin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
