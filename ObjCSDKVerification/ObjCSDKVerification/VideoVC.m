//
//  VideoVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "VideoVC.h"
#import <AmpiriSDK/Ampiri.h>

@interface VideoVC()

@property (strong) AMPVideo *video;
@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) wSelf = self;
    [[AmpiriSDK sharedSDK]
     loadVideoWithAdUnitId: @"87f65c4c-f12d-4bb6-96fd-063fe30c4d69"
     success :^(AMPVideo *video) {
         __strong typeof(self) sSelf = wSelf;
         sSelf.video = video;
         [video showFromViewController:sSelf];
     }       failure: ^(AMPError *error) {
         NSLog(@"Error: %@", error.localizedDescription);
     }];
}

@end
