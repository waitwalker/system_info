import Flutter
import UIKit

public class SwiftSystemInfoPlugin: NSObject, FlutterPlugin {
  static var mChannel: FlutterMethodChannel?
  /// 实例化name为system_info的channel并注册到插件列表中
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_info", binaryMessenger: registrar.messenger())
      mChannel = channel
    let instance = SwiftSystemInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  /// 用于监听处理flutter传递过来的消息
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
          
          /// iOS调用Flutter中的方法
          SwiftSystemInfoPlugin.mChannel?.invokeMethod("appName", arguments: nil, result: { data in
              
          })
      }
      
      result(FlutterMethodNotImplemented)
  }
}
