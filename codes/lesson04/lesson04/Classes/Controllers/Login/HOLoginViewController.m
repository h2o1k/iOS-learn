//
//  HOLoginViewController.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOLoginViewController.h"
#import "HOLoginRequest.h"
#import "HOGlobal.h"

@interface HOLoginViewController ()<HOLoginRequestDelegate>

@property(nonatomic, strong)HOLoginRequest *loginRequest;

@end

@implementation HOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    self.view.backgroundColor = [UIColor cyanColor];
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Memory managements methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom methods

- (IBAction)loginButtonClicked:(id)sender {
    NSLog(@"用户登录操作");
    self.loginRequest = [[HOLoginRequest alloc] init];
    [self.loginRequest sendLoginRequestWithUserName:self.userNameTextField.text password:self.passwordTextField.text delegate:self];
}

#pragma mark - HOLoginRequestDelegate methods

-(void)requestFail:(HOLoginRequest *)request error:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:error.description delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)requestSuccess:(HOLoginRequest *)request user:(HOUser *)user {
    [HOGlobal shareGlobal].user = user;
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate loadMainView];
}

@end
