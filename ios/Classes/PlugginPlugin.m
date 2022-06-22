#import "PlugginPlugin.h"
#if __has_include(<pluggin/pluggin-Swift.h>)
#import <pluggin/pluggin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pluggin-Swift.h"
#endif

@implementation PlugginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlugginPlugin registerWithRegistrar:registrar];
}
@end
