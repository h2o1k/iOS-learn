//
//  HOArchiveViewController.h
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HOUser.h"
#import "Utility.h"

@interface HOArchiveViewController : UIViewController<UITextFieldDelegate> {
    UITextField *_userNameTextField;
    UITextField *_emailTextField;
    UITextField *_passwordTextField;
    UITextField *_ageTextField;
}

-(void)initVariables;

-(void)initComponents;

@end
