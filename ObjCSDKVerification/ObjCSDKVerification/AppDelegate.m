//
//  AppDelegate.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "AppDelegate.h"
#import <AmpiriSDK/AmpiriSDK.h>

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AmpiriSDK setLogEnabled:YES];
    return YES;
}

@end
