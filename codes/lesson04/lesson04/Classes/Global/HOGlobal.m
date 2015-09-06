//
//  HOGlobal.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOGlobal.h"

static HOGlobal *global = nil;

@implementation HOGlobal

+(HOGlobal *)shareGlobal {
    if (global == nil) {
        global = [[HOGlobal alloc] init];
    }
    return global;
}

@end
