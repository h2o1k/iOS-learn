//
//  BaseViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.bgImageView.backgroundColor = [UIColor clearColor];
    self.bgImageView.image = [UIImage imageNamed:@"Default"];
    [self.view addSubview:self.bgImageView];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
 
}

/* 只对iOS6之前版本有效
- (void)viewDidUnload {
    [super viewDidUnload];
    NSLog(@"%@ viewDidUnload", self.title);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    /*
    NSLog(@"%@ didReceiveMemoryWarning", self.title);
    if (self.view.window == nil) {
        self.view = nil;
        [self viewDidUnload];
    }
     */
}

@end
