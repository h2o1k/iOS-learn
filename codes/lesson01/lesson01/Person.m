//
//  Person.m
//  lesson01
//
//  Created by snddfhv on 15/7/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Person.h"

@implementation Person


- (id) initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        // _name = name;
        _age = age;
    }
    return self;
}

- (void) sayMyInfo {
    NSLog(@"我叫 %@, 今年 %li 岁", _name, _age);
}

+ (void) printMessage:(NSString *) message {
    NSLog(@"已经打印出：%@", message);
}

@end
