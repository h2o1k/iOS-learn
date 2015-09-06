//
//  UserSpaceViewController.h
//  uidemo
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Message;

@interface UserSpaceViewController : UIViewController {
    Message *_message;
}

@property (nonatomic, retain) Message *message;

@end
