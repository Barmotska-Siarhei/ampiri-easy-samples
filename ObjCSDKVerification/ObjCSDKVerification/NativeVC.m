//
//  NativeVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

#import "NativeVC.h"
#import <AmpiriSDK/AmpiriSDK.h>
#import "MyNativeBannerView.h"


@implementation NativeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    [[AmpiriSDK sharedSDK]
     loadNativeAdWithAdUnitId: @"7f900c7d-7ce3-4190-8e93-310053e70ca2"
     parentViewController: self
     adViewClassForRendering: [MyNativeBannerView class]
     success: ^(UIView *adNativeViewContainer) {
         __strong typeof(self) sSelf = wSelf;
         adNativeViewContainer.center = CGPointMake(sSelf.view.frame.size.width/2, sSelf.view.frame.size.height/2);
         [sSelf.view addSubview: adNativeViewContainer];
     }
     failure: ^(AMPError *error) {
         NSLog(@"Error: %@", error.localizedDescription);
     }];
}

@end
