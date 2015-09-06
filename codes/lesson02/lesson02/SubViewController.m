//
//  SubViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "SubViewController.h"
#import "OneViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController


#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.view.window == nil) {
        // 收到内存不中提醒时，如果这个页面不是当前显示的页面 。。。。
    }
}

- (void) dealloc {
    NSLog(@"%@ 调用dealloc", self.title);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ 将要显示", self.title);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ 已经显示", self.title);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ 将要消失", self.title);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ 已经消失", self.title);
}

#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"Sub";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [backButton setBackgroundColor:[UIColor cyanColor]];
    [backButton setTitle:@"back One" forState:UIControlStateNormal];
    // [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end

}

- (void) viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - Custom event methods

- (void) backButtonClicked:(id)sender {
    if (self.navigationController) { // present这种方式不入栈，因此这个值为空
        // 这里写的是popViewControlleranimated哦
        [self.navigationController popViewControllerAnimated:YES];
        // [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
