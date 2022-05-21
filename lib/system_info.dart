
import 'dart:async';

import 'package:flutter/services.dart';

class SystemInfo {
  /// channel的初始化 name：system_info，在对应平台上要保持一致
  static const MethodChannel _channel = MethodChannel('system_info');
  static Future<String?> get platformVersion async {
    /// 获取对应平台系统版本 主要通过invokeMethod方法，getPlatformVersion是我们调用平台对应的方法
    final String? version = await _channel.invokeMethod('getPlatformVersion');

    /// Flutter监听Platform发过来的消息
    _channel.setMethodCallHandler((call) async{
      if (call.method == "appName") {
        print("Platorm 调用 Flutter中的方法");
      }
    });
    return version;
  }
}
