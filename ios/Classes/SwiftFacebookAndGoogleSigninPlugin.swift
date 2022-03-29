import Flutter
import UIKit

public class SwiftFacebookAndGoogleSigninPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "facebook_and_google_signin", binaryMessenger: registrar.messenger())
    let instance = SwiftFacebookAndGoogleSigninPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
