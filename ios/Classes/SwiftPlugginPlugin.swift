import Flutter
import UIKit

public class SwiftPlugginPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pluggin", binaryMessenger: registrar.messenger())
    let instance = SwiftPlugginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "getDefaultGreeting":
            result("Hello from IOS")
        default:
            result("not implemented")
    }

  }
}
