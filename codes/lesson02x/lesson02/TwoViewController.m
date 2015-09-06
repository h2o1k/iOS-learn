//
//  TwoViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"Two";
    NSLog(@"%@ viewDidLoad", self.title);
    self.bgImageView.image = [UIImage imageNamed:@"bg2"];
    
    /** 常用组件之UITextField */
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, self.view.frame.size.width - 20, 31)];
    textField.borderStyle = UITextBorderStyleRoundedRect; // 圆角矩形
    textField.placeholder = @"please input email"; // 提示
    // textField.secureTextEntry = YES; // 如果输入内容为密码，用这个
    textField.clearButtonMode = UITextFieldViewModeWhileEditing; // 清空图标的样式
    textField.keyboardType = UIKeyboardTypeEmailAddress; // 键盘样式      UIKeyboardTypePhonePad 电话号码样式
    textField.returnKeyType = UIReturnKeyGo; // Go/Done
    textField.font = [UIFont systemFontOfSize:14.0f];
    textField.textColor = [UIColor cyanColor];
    textField.delegate = self;
    textField.contentVerticalAlignment = UIViewContentModeCenter; // 垂直居中
    [self.view addSubview:textField];
    
    /** 常用组件之UITextView */
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, textField.frame.origin.y + 31 + 10, self.view.frame.size.width - 20, 80)];
    textView.backgroundColor = [UIColor redColor];
    textView.textColor = [UIColor blackColor];
    textView.delegate = self;
    // textView.keyboardType = UIKeyboardTypeEmailAddress;
    textView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:textView];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
    
}

#pragma mark - UITextFieldDelegate methods

// 关闭键盘
- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    NSLog(@"关闭键盘  %@", textField.text);
    [textField resignFirstResponder]; // 注销掉第一响应者
    return YES;
}

// 将要结束编辑
- (BOOL)textFieldShouldEndEditing:(nonnull UITextField *)textField {
    NSLog(@"将要结束编辑  %@", textField.text);
    return YES;
}

// 已经结束编辑
- (void)textFieldDidEndEditing:(nonnull UITextField *)textField {
    NSLog(@"已经结束编辑  %@", textField.text);
}

// 文本发生变化啦
- (void)textViewDidChange:(nonnull UITextView *)textView {
    NSLog(@" %@", textView.text);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text {
    // 返回YES，才能输入到输入框中，返回NO是输入不进去的
    
    // 捕获换行符
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder]; //
        return NO;
    }
    return YES;
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
