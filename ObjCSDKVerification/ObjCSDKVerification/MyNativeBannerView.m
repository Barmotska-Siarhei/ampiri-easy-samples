//
//  MyNativeBannerView.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 21/02/2017.
//  All rights reserved.
//

#import "MyNativeBannerView.h"

@implementation MyNativeBannerView

+ (CGFloat)desiredHeight {
    return 70;
}

+ (NSString *)xibName {
    return NSStringFromClass([self class]);
}

@end
