//
//  AppDelegate.m
//  lesson01
//
//  Created by snddfhv on 15/7/22.
//  Copyright (c) 2015年 snddfhv. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// did
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    printf("didFinishLaunchingWithOptions\n");
    return YES;
}

// active->resign  晚上睡觉前定闹钟
- (void)applicationWillResignActive:(UIApplication *)application {
    printf("晚上睡觉前定闹钟\n");
}

// 前台->后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
   printf("已经睡着了\n");
}

// 后台->前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    printf("将要起床了\n");
}

// resign->active  早上起来关闹钟
- (void)applicationDidBecomeActive:(UIApplication *)application {
    printf("起床后关闹钟\n");
}

// 突然挂掉
- (void)applicationWillTerminate:(UIApplication *)application {
    printf("应用突然挂掉了\n");
}

@end
