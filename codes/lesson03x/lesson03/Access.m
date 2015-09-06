//
//  Access.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Access.h"

@implementation Access

- (id)init {
    self = [super init];
    count++;
    return self;
}

+ (int)initCount {
    return count;
}

+ (void)initialize {
    printf("initialize...\n");
    count = 0;
}

@end
