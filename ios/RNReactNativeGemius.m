#import "RNReactNativeGemius.h"
#import <GemiusSDK/headers/GemiusSDK.h>
#import <React/RCTLog.h>

@implementation RNReactNativeGemius

RCT_EXPORT_MODULE()

// used in example project
RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
      [[GEMConfig sharedInstance] setAppInfo:@"AdOceanSDK_Demo" version:@"1.8.0"];
    callback(@[[NSString stringWithFormat: @"NumberArguments: %@ StringArgument: %@", numberArgument, stringArgument]]);
}

RCT_EXPORT_METHOD(setAppInfo:(NSString *)app version:(NSString *)version)
{
    [[GEMConfig sharedInstance] setAppInfo:app version:version];
}

RCT_EXPORT_METHOD(setLoggingEnabled:(BOOL *)isLoggingEnabled)
{
    [[GEMConfig sharedInstance] setLoggingEnabled:isLoggingEnabled];
}

RCT_EXPORT_METHOD(setGemiusInfo:(NSString *)host scriptIdentifierIos:(NSString *)scriptIdentifierIos scriptIdentifierAndroid:(NSString *)scriptIdentifierAndroid)
{
    [[GEMAudienceConfig sharedInstance] setHitcollectorHost:host];
    [[GEMAudienceConfig sharedInstance] setScriptIdentifier:scriptIdentifierIos];
}

RCT_EXPORT_METHOD(sendPageViewedEvent)
{
    GEMAudienceEvent *event = [GEMAudienceEvent new];
    [event sendEvent];
}

@end
