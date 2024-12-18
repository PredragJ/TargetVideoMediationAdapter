//
//  TargetVideoMediationAdapter.h
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 15.12.24..
//
#import "AppLovinSDK/AppLovinSDK.h"

@interface TargetVideoMediationAdapter : NSObject <MAAdapter, MAAdViewAdapter, MAInterstitialAdapter, MARewardedAdapter>

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters
               completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler;

@end

