#import "ReactNativeGemius.h"
#import <React/RCTLog.h>
#import <GemiusSDK/GemiusSDK.h>

@implementation ReactNativeGemius

RCT_EXPORT_MODULE()

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
