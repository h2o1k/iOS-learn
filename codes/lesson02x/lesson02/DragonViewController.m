//
//  DragonViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/3.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "DragonViewController.h"

@interface DragonViewController ()

@end

@implementation DragonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 图片显示  UIImageView
    _dragonView = [[DragonView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 180)];
    // imageView.image = [UIImage imageNamed:@"bg5.png"];
    // imageView.backgroundColor = [UIColor whiteColor];
    // imageView.contentMode = UIViewContentModeScaleAspectFit; // 等比缩放
    _dragonView.delegate = self;
    [self.view addSubview:_dragonView];
    
    // 隐藏按钮及返回按钮  button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, _dragonView.frame.size.height+110, self.view.bounds.size.width - 20, 44);
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    UIImage *blueBGImage = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [backButton setBackgroundImage:stretchableBlueBGImage forState:UIControlStateNormal];
    [backButton addTarget:self
                       action:@selector(myBackButtonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // 状态显示  label
    NSInteger label_y = self.view.frame.size.height - 66;
    _dragonStatusLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, label_y, self.view.frame.size.width - 20, 60)];
    // _dragonStatusLabel.userInteractionEnabled = YES;
    _dragonStatusLabel.backgroundColor = [UIColor cyanColor];
    _dragonStatusLabel.textColor = [UIColor blueColor];
    _dragonStatusLabel.textAlignment = NSTextAlignmentCenter;
    _dragonStatusLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _dragonStatusLabel.numberOfLines = 0; // 最大显示行数，设置成0则不限制
    _dragonStatusLabel.lineBreakMode = NSLineBreakByWordWrapping; // 按字换行
    [self.view addSubview:_dragonStatusLabel];
    _dragonStatusLabel.text = @"小龙的状态";
    // 计算label的高度
//    CGSize textSize = [_dragonStatusLabel.text boundingRectWithSize:CGSizeMake(_dragonStatusLabel.frame.size.width - 25, CGFLOAT_MAX)
//                                               options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
//                                            attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}
//                                               context:nil].size;
//    _dragonStatusLabel.frame = CGRectMake(10, _dragonStatusLabel.frame.origin.y, textSize.width, textSize.height);
    
}

#pragma mark - DragonViewDelegate implements methods

- (void)backButtonClicked:(DragonView *)dragonView {
    CGFloat x = dragonView.dragonImageView.frame.origin.x;
    CGFloat y = dragonView.dragonImageView.frame.origin.y;
    _dragonStatusLabel.text = [NSString stringWithFormat:@"小龙在后退--->(%f,%f)", x, y];
}

- (void)forwardButtonClicked:(DragonView *)dragonView {
    CGFloat x = dragonView.dragonImageView.frame.origin.x;
    CGFloat y = dragonView.dragonImageView.frame.origin.y;
    _dragonStatusLabel.text = [NSString stringWithFormat:@"小龙在前进--->(%f,%f)", x, y];
}

#pragma mark - Custom event methods

- (void)myBackButtonClicked:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Memory managment methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
