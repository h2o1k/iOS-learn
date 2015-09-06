//
//  HOUser.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOAddress.h"

@interface HOUser : NSObject

@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, copy) NSString *headImageUrl;
@property(nonatomic, strong) HOAddress *address;

@end
