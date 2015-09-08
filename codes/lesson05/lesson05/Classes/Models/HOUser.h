//
//  HOUser.h
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSData必须实现NSCoding的协议
@interface HOUser : NSObject<NSCoding>

@property(nonatomic, retain)NSString *userName;
@property(nonatomic, retain)NSString *email;
@property(nonatomic, retain)NSString *password;
@property(nonatomic, assign)NSInteger age;

@end
