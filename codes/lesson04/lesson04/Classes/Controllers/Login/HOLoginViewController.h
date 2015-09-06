//
//  HOLoginViewController.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "AppDelegate.h"
#import "HOGoodsListViewController.h"

@interface HOLoginViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonClicked:(id)sender;


@end
