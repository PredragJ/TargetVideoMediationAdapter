//
//  TargetVideoMediationAdapter.m
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 15.12.24..
//

#import "TargetVideoMediationAdapter.h"

@implementation TargetVideoMediationAdapter

#pragma mark - MAAdapter Methods

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters
               completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler
{
    NSLog(@"[TargetVideoMediationAdapter] Initializing adapter with parameters: %@", parameters);
    completionHandler(MAAdapterInitializationStatusInitialized, nil); // Successful initialization
}

- (NSString *)sdkVersion
{
    return @"1.0.0"; // Replace with the version of your ad network's SDK
}

- (NSString *)adapterVersion
{
    return @"1.0.0.0"; // Replace with the version of this adapter
}

- (void)destroy
{
    NSLog(@"[TargetVideoMediationAdapter] Cleaning up resources");
}

#pragma mark - MAAdViewAdapter Methods

- (void)loadAdViewAdForParameters:(id<MAAdViewAdapterParameters>)parameters
                         adFormat:(MAAdFormat *)adFormat
                         delegate:(id<MAAdViewAdapterDelegate>)delegate
{
    NSLog(@"[TargetVideoMediationAdapter] Loading AdView Ad for format: %@", adFormat);

    // Simulating ad view loading
    UIView *adView = [[UIView alloc] init];
    adView.backgroundColor = [UIColor grayColor]; // Example ad content

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delegate didLoadAdForAdView:adView];
        NSLog(@"[TargetVideoMediationAdapter] AdView Ad loaded successfully");
    });
}

#pragma mark - MAInterstitialAdapter Methods

- (void)loadInterstitialAdForParameters:(id<MAAdapterResponseParameters>)parameters
                               delegate:(id<MAInterstitialAdapterDelegate>)delegate
{
    NSLog(@"[TargetVideoMediationAdapter] Loading Interstitial Ad");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delegate didLoadInterstitialAd];
        NSLog(@"[TargetVideoMediationAdapter] Interstitial Ad loaded successfully");
    });
}

- (void)showInterstitialAdForParameters:(id<MAAdapterResponseParameters>)parameters
                              andNotify:(id<MAInterstitialAdapterDelegate>)delegate
{
    NSLog(@"[TargetVideoMediationAdapter] Showing Interstitial Ad");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delegate didDisplayInterstitialAd];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [delegate didHideInterstitialAd];
            NSLog(@"[TargetVideoMediationAdapter] Interstitial Ad closed");
        });
    });
}

#pragma mark - MARewardedAdapter Methods

- (void)loadRewardedAdForParameters:(id<MAAdapterResponseParameters>)parameters
                           delegate:(id<MARewardedAdapterDelegate>)delegate
{
    NSLog(@"[TargetVideoMediationAdapter] Loading Rewarded Ad");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delegate didLoadRewardedAd];
        NSLog(@"[TargetVideoMediationAdapter] Rewarded Ad loaded successfully");
    });
}

- (void)showRewardedAdForParameters:(id<MAAdapterResponseParameters>)parameters
                          andNotify:(id<MARewardedAdapterDelegate>)delegate
{
    NSLog(@"[TargetVideoMediationAdapter] Showing Rewarded Ad");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [delegate didDisplayRewardedAd];
        [delegate didStartRewardedAdVideo];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [delegate didCompleteRewardedAdVideo];
            [delegate didRewardUserWithReward:[[MAReward alloc] initWithLabel:@"Reward" amount:@1]];
            [delegate didHideRewardedAd];
            NSLog(@"[TargetVideoMediationAdapter] Rewarded Ad finished and user rewarded");
        });
    });
}

@end
