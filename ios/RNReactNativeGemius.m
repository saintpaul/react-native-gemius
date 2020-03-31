#import "RNReactNativeGemius.h"
#import <React/RCTLog.h>
#import <GemiusSDK/GemiusSDK.h>

@implementation RNReactNativeGemius

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"NumberArgument: %@ StringArgument: %@", numberArgument, stringArgument]]);
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
