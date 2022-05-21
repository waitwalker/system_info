#import "SystemInfoPlugin.h"
#if __has_include(<system_info/system_info-Swift.h>)
#import <system_info/system_info-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "system_info-Swift.h"
#endif

@implementation SystemInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSystemInfoPlugin registerWithRegistrar:registrar];
}
@end
