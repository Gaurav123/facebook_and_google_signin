#import "FacebookAndGoogleSigninPlugin.h"
#if __has_include(<facebook_and_google_signin/facebook_and_google_signin-Swift.h>)
#import <facebook_and_google_signin/facebook_and_google_signin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "facebook_and_google_signin-Swift.h"
#endif

@implementation FacebookAndGoogleSigninPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFacebookAndGoogleSigninPlugin registerWithRegistrar:registrar];
}
@end
