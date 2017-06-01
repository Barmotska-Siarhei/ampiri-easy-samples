//
//  BannerVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "BannerVC.h"
#import <AmpiriSDK/Ampiri.h>

@interface BannerVC()

@property (strong) AMPBannerView *bannerView;
@end

@implementation BannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    AMPBannerView * bannerView = [[AmpiriSDK sharedSDK] loadBannerWithSize: AMPBannerViewSizeSmall
                                     adUnitId: @"04c447d7-ffb8-4ba1-985e-4d2b9f88cd69"
                                      success: ^{
                                          __strong typeof(self) sSelf = wSelf;
                                          AMPBannerView *banner = self.bannerView;
                                          banner.center = CGPointMake(sSelf.view.frame.size.width/2, sSelf.view.frame.size.height/2);
                                          [sSelf.view addSubview:banner];
                                          sSelf.bannerView = banner;
                                      } failure: ^(AMPError * error) {
                                          NSLog(@"Error: %@", error.localizedDescription);
                                      }];
   
    [bannerView onClick:^{
        NSLog(@"Click event");
    }];
    self.bannerView = bannerView;
}

@end
