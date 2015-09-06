//
//  UserSpaceViewController.m
//  uidemo
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "UserSpaceViewController.h"
#import "Message.h"

@implementation UserSpaceViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    self.navigationItem.title = self.message.sender.name;
    UIImage *image = [UIImage imageWithContentsOfFile:self.message.sender.lifePhotoPath];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
