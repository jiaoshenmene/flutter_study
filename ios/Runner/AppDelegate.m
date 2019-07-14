#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate
{
    FlutterEventSink _eventSink;
    FlutterResult _flutterResult;
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/battery" binaryMessenger:controller];
    FlutterMethodChannel *viewChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/platform_view" binaryMessenger:controller];
    
    [viewChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"switchView" isEqualToString:call.method]) {
            _flutterResult = result;
            PlatformViewController *platformViewController = [controller.storyboard instantiateViewControllerWithIdentifier:@"PlatformView"];
            platformViewController.counter = ((NSNumber *)call.arguments).intValue;
            platformViewController.delegate = self;
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:platformViewController];
            nav.navigationBar.topItem.title = @"Platform View";
            [controller presentViewController:nav animated:NO completion:nil];
        } else {
            result(FlutterMethodNotImplemented);
        }
        
    }];
    
    
    __weak typeof(self) weakSelf = self;
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"getBatteryLevel" isEqualToString:call.method]) {
            int batteryLevel = [weakSelf getBatteryLevel];
            if (batteryLevel == -1) {
                result([FlutterError errorWithCode:@"UNAVAILABLE" message:@"Battery info unavailable" details:nil]);
            } else {
                result(@(batteryLevel));
            }
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    FlutterEventChannel *chargingChannel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/charging" binaryMessenger:controller];
    [chargingChannel setStreamHandler:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)didUpdateCounter:(int)counter {
    _flutterResult([NSNumber numberWithInt:counter]);
}

- (int)getBatteryLevel {
    UIDevice *device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return ((int)(device.batteryLevel * 100));
    }
}

- (FlutterError *)onListenWithArguments:(id)arguments
                              eventSink:(FlutterEventSink)events{
    _eventSink = events;
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    [self sendBatteryStateEvent];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(onBatteryStateDidChange:) name:UIDeviceBatteryStateDidChangeNotification object:nil];
    return nil;
}

- (void)onBatteryStateDidChange:(NSNotification *)notification {
    [self sendBatteryStateEvent];
}

- (void)sendBatteryStateEvent {
    if (!_eventSink) {
        return;
    }
    UIDeviceBatteryState state = [[UIDevice currentDevice] batteryState];
    switch (state) {
        case UIDeviceBatteryStateFull:
        case UIDeviceBatteryStateCharging:
            _eventSink(@"charging");
            break;
        case UIDeviceBatteryStateUnplugged:
            _eventSink(@"discharging");
            break;
        default:
            _eventSink([FlutterError errorWithCode:@"UNAVAILABLE" message:@"Charging status unavailable" details:nil]);
            break;
    }
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _eventSink = nil;
    return nil;
}
@end
