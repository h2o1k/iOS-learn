//
//  MessageListViewController.h
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Message.h"
#import "CustomCell.h"
#import "UserSpaceViewController.h"

@interface MessageListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, CustomCellDelegate> {
    UITableView *_tableView;
    NSMutableArray *_messageArray;
}

- (void)createMessageData;

@end
