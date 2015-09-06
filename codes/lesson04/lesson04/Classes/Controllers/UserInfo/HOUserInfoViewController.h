//
//  HOUserInfoViewController.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOGoodsListViewController.h"

@interface HOUserInfoViewController : BaseViewController

// 用户头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
// 下载进度条
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgressView;
// 下载按钮
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
// 用户信息标签
@property (weak, nonatomic) IBOutlet UILabel *userInfoLabel;
// 等待框
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
// 头像高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImageHeightConstraint;

// 下载按钮点击事件
- (IBAction)downloadButtonClicked:(id)sender;

@end
