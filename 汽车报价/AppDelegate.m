//
//  AppDelegate.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarContoller.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //| ----------------------------------------------------------------------------------
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[MainTabBarContoller alloc] init];
    
    
    return YES;
}


@end
