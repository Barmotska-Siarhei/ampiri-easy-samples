//
//  InterstitialVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "InterstitialVC.h"
#import <AmpiriSDK/Ampiri.h>

@interface InterstitialVC()

@property (strong) AMPInterstitial *interstitial;
@end

@implementation InterstitialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    [[AmpiriSDK sharedSDK]
     loadInterstitialWithAdUnitId: @"2cb34a73-0012-4264-9526-bde1fce2ba92"
     success: ^(AMPInterstitial *interstitial) {
         __strong typeof(self) sSelf = wSelf;
         sSelf.interstitial = interstitial;
         [interstitial showFromViewController:sSelf];
     }             failure: ^(AMPError *error) {
         NSLog(@"Error: %@", error.localizedDescription);
     }];
}

@end
