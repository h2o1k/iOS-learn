//
//  HOGlobal.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOUser.h"

@interface HOGlobal : NSObject

@property(nonatomic, strong)HOUser *user;

+(HOGlobal *)shareGlobal;

@end
