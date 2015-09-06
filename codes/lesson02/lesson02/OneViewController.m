//
//  OneViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "OneViewController.h"
#import "SubViewController.h"

// k开头表示是一个宏定义
#define kPushButtonTag 100
#define kPressButtonTag 101
#define kTestButtonTag 102
#define kOneAlertViewTag 103


@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"One";
    NSLog(@"%@ viewDidLoad", self.title);
    
    self.bgImageView.image= [UIImage imageNamed:@"bg1"];
    
    /** pushButton */
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [pushButton setTitle:@"push a view" forState:UIControlStateNormal];
    // [pushButton setBackgroundColor:[UIColor cyanColor]];
    // 定义一张图片，并拉伸
    UIImage *blueBGImage = [UIImage imageNamed:@"blueButton.png"];
    // 10,20的函义
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [pushButton setBackgroundImage:stretchableBlueBGImage forState:UIControlStateNormal];
    [pushButton addTarget:self
                   action:@selector(pushButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    /** presentButton */
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [presentButton setTitle:@"presnet a modal view" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // [presentButton setBackgroundColor:[UIColor yellowColor]];
    UIImage *whiteBGImage = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage = [whiteBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton setBackgroundImage:stretchableWhiteBGImage forState:UIControlStateNormal];
    [presentButton addTarget:self
                   action:@selector(presentButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    /** 常用组件之UIButton */
    // UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom]; // 表示什么都没有
    // UIButton *testButton = [UIButton buttonWithType:UIButtonTypeInfoDark]; // infoButton
    UIButton *testButton = [[UIButton alloc]init];
    testButton.tag = 100;
    testButton.frame = CGRectMake(10, 192, self.view.bounds.size.width - 20, 44);
    [testButton setTitle:@"测试按钮" forState:UIControlStateNormal];
    [testButton setTitle:@"点击时，改变文字" forState:UIControlStateHighlighted];
    [testButton setBackgroundColor:[UIColor clearColor]]; // clearColor 透明
    // 为UIButton设置图片 infoButton不用设置图片
    [testButton setBackgroundImage:stretchableBlueBGImage forState:UIControlStateNormal];
    [self.view addSubview:testButton];
    
    /** 常用组件之UIBarButton */
    UIBarButtonItem *rightAlertButton = [[UIBarButtonItem alloc]initWithTitle:@"alert"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(alertButtonClicked:)];
    self.navigationItem.rightBarButtonItem = rightAlertButton;
    UIBarButtonItem *leftAlertButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftAlertButton;
    
    /** 常用组件之UIImageView */
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, testButton.frame.origin.y + testButton.frame.size.height+10,self.view.frame.size.width-20,100)];
    imageView.image = [UIImage imageNamed:@"bg5.png"];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit; // 等比缩放
    [self.view addSubview:imageView];

    /** 常用组件之UILabel */
    NSInteger label_y = imageView.frame.origin.y + imageView.frame.size.height + 10;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, label_y, self.view.frame.size.width - 20, 80)];
    label.userInteractionEnabled = YES;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.numberOfLines = 0; // 最大显示行数，设置成0则不限制
    label.lineBreakMode = NSLineBreakByWordWrapping; // 按字换行
    [self.view addSubview:label];
    label.text = @"line1 this is a label! this is a label!\n\nline2 this is a label! this is a label!";
    // 计算label的高度
    CGSize textSize = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width - 25, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}
                                               context:nil].size;
    label.frame = CGRectMake(10, label.frame.origin.y, textSize.width, textSize.height);
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - UIAlertViewDelegage methods

// 完全消失后触发
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

// 一点击就触发
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex  {
    if (alertView.tag == kOneAlertViewTag) {
        NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
        if ([buttonTitle isEqualToString:@"one"]) {
            /** 常用组件之UIActionSheet */
            // UIActionSheet在IOS8被deprecated UIAlertController代替 preferredStyle:UIAlertControllerStyleActionSheet
            UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"title"
                                                                    delegate:self
                                                           cancelButtonTitle:@"cancel"
                                                      destructiveButtonTitle:@"destructive"
                                                           otherButtonTitles:@"one", @"two", @"three", nil];
            [actionSheet showInView:self.view];
        }
    }
}

#pragma mark - Custom event methods

- (void)alertButtonClicked:(UIBarButtonItem *)sender {
    /** 常用组件之UIAlertView */
    // UIAlertView在iOS8及被deprecated UIAlertController代替 preferredStyle:UIAlertControllerStyleAlert
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"title"
                                                   message:@"alert message"
                                                  delegate:self
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"one", @"two", @"three", nil];
    alert.tag = kOneAlertViewTag;
    [alert show];
    // [alert dismissWithClickedButtonIndex:0 animated:YES]; // 如果没有取消按钮，这是用代码的方式进行取消
    
    /** 常用组件之UIAlertController */
    // iOS8及以后才支持的
    /*
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"OK2"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* defaultAction3 = [UIAlertAction actionWithTitle:@"OK3"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [alert addAction:defaultAction2];
    [alert addAction:defaultAction3];
    [self presentViewController:alert animated:YES completion:nil];
     */
}

// 如果两个按钮注册了同一个事件，那么用tag来区分到底响应哪个button
// tag一般做一个宏
- (void)buttonClicked:(UIButton *)sender {
    if (sender.tag == 200) {
    
    } else if (sender.tag == 100) {
    
    }
}

- (void) pushButtonClicked:(id)sender {
    SubViewController *subViewController = [[SubViewController alloc] init];
    [self.navigationController pushViewController:subViewController animated:YES];
}

- (void) presentButtonClicked:(id)sender {
    SubViewController *subViewController = [[SubViewController alloc] init];
    // [self presentModalViewController:(UIViewController *) animated:YES];
    [self presentViewController:subViewController animated:YES completion:nil];
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
