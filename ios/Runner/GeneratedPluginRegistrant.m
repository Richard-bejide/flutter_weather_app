//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<geolocator/GeolocatorPlugin.h>)
#import <geolocator/GeolocatorPlugin.h>
#else
@import geolocator;
#endif

#if __has_include(<location_permissions/LocationPermissionsPlugin.h>)
#import <location_permissions/LocationPermissionsPlugin.h>
#else
@import location_permissions;
#endif

#if __has_include(<simple_connectivity/FLTConnectivityPlugin.h>)
#import <simple_connectivity/FLTConnectivityPlugin.h>
#else
@import simple_connectivity;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [LocationPermissionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPermissionsPlugin"]];
  [FLTConnectivityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTConnectivityPlugin"]];
}

@end
