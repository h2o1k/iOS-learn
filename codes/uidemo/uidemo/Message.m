//
//  Message.m
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize sender = _sender;
@synthesize text = _text;
@synthesize sendDate = _sendDate;

+ (Message *)messageWithSender:(User *)aSender text:(NSString *)aText sendDate:(NSDate *)aDate {
    Message *message = [[Message alloc]init];
    message.sender = aSender;
    message.text = aText;
    message.sendDate = aDate;
    return message;
}

- (void)dealloc {
    self.sender = nil;
    self.text = nil;
    self.sendDate = nil;
}

@end
