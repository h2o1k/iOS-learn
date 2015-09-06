//
//  AppDelegate.m
//  uidemo
//
//  Created by snddfhv on 15/8/25.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - custom methods

- (void)loadMainFrame {
    // 定义UINavigationController
    // ViewController
    ViewController *oneViewController = [[ViewController alloc] init];
    UINavigationController *oneNavigationController = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    oneNavigationController.tabBarItem.title = @"One";
    oneNavigationController.tabBarItem.image= [UIImage imageNamed:@"one.png"];
    // MessageListViewController
    MessageListViewController *twoViewController = [[MessageListViewController alloc] init];
    UINavigationController *twoNavigationController = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    twoNavigationController.tabBarItem.title = @"Two";
    twoNavigationController.tabBarItem.image = [UIImage imageNamed:@"two.png"];
    
    // 定义UITabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[oneNavigationController, twoNavigationController]];
    
    self.window.rootViewController = tabBarController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    NSLog(@"AppDelegate application");
    [self loadMainFrame];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
