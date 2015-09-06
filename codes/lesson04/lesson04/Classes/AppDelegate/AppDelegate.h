//
//  AppDelegate.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HOUserInfoViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *loginNavigationController;

-(void)loadLoginView;

-(void)loadMainView;

@end

