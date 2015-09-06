//
//  Cup.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Cup.h"
#import "CupWarningException.h"
#import "CupOverflowException.h"

@implementation Cup

- (Cup *)init {
    self = [super init];
    if (self) {
        [self setLevel:0];
    }
    return self;
}

- (int)level {
    return _level;
}

- (void)setLevel:(int)level {
    if (level > 100) {
        NSException *e = [[CupWarningException alloc]
                                                    initWithName:@"CupWarningException"
                                                    reason:@"the level is above 100"
                                                    userInfo:nil];
        @throw e;
    } else if (level >= 50) {
        NSException *e = [[CupWarningException alloc]
                          initWithName:@"CupWarningException"
                          reason:@"the level is above 50"
                          userInfo:nil];
        @throw e;
    } else if (level < 0) {
        NSException *e = [[CupOverflowException alloc]
                          initWithName:@"CupOverflowException"
                          reason:@"the level is below 0"
                          userInfo:nil];
        @throw e;
    }
    _level = level;
}

- (void)fill {
    [self setLevel:_level + 10];
}

- (void)empty {
    [self setLevel:_level - 10];
}

- (void)print {
    printf("Cup level is %i\n", [self level]);
}

@end
