//
//  Message.h
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Message : NSObject {
    User *_sender;
    NSString *_text;
    NSDate *_sendDate;
}

@property (nonatomic, retain) User *sender;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) NSDate *sendDate;

+ (Message *)messageWithSender:(User *)aSender text:(NSString *)aText sendDate:(NSDate *)aDate;

@end
