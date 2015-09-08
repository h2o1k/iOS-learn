//
//  HOUser.m
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOUser.h"

@implementation HOUser

#pragma mark - NSCodingDelegate methods

// 编码
-(void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeInteger:_age forKey:@"age"];
}

// 解码
-(nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

#pragma mark - Memory management methods

-(void)dealloc {
    self.userName = nil;
    self.email = nil;
    self.password = nil;
}

@end
