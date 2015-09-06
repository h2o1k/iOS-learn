//
//  AppDelegate.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - custom methods

-(void)loadLoginView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
    self.loginNavigationController   = storyboard.instantiateInitialViewController;
    self.window.rootViewController = self.loginNavigationController;
}

-(void)loadMainView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"UserInfo" bundle:[NSBundle mainBundle]];
    HOUserInfoViewController *userInfoViewController = [storyboard instantiateViewControllerWithIdentifier:@"HOUserInfoViewController"];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:userInfoViewController];
    navc.tabBarItem.title = @"userInfo";
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navc];
    
    self.window.rootViewController = tabBarController;
    
    // 切换RootView动画效果
    [self.window addSubview:self.loginNavigationController.view];
    [UIView animateWithDuration:0.5
                     animations:^{ // 初始状态
                         self.loginNavigationController.view.alpha = 0;
                         // self.loginNavigationController.view.frame = CGRectZero;
                         self.loginNavigationController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
                     }
                     completion:^(BOOL finished) { // 最终状态
                         self.loginNavigationController = nil;
                     }];
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    // CGRect test = [[UIScreen mainScreen] bounds];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor greenColor];
    // [self.window setRootViewController:[[BaseViewController alloc] init]];
    [self loadLoginView];
    [self.window makeKeyAndVisible];

    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
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
