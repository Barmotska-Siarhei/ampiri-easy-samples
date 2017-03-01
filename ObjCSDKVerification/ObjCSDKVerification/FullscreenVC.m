//
//  FullscreenVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "FullscreenVC.h"
#import <AmpiriSDK/AmpiriSDK.h>

@interface FullscreenVC()

@property (strong) AMPFullscreenBannerController *interstitial;
@end

@implementation FullscreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    [[AmpiriSDK sharedSDK]
     loadFullscreenWithAdUnitId: @"2cb34a73-0012-4264-9526-bde1fce2ba92"
     options: AMPFullscreenLoadOptionsDefault
     forViewController: self
     success: ^(AMPFullscreenBannerController *fullscreenController) {
         __strong typeof(self) sSelf = wSelf;
         sSelf.interstitial = fullscreenController;
         [fullscreenController showFromViewController:sSelf];
     }             failure: ^(AMPError *error) {
         NSLog(@"Error: %@", error.localizedDescription);
     }];
}

@end
