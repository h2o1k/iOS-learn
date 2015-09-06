//
//  Square.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Square.h"

@implementation Square

- (Square *)initWithSize:(int)size {
    self = [super init];
    if (self) {
        [self setSize:size];
    }
    return self;
}

- (void)setSize:(int)size {
    _width = size;
    _height = size;
}

- (int)size {
    return _width;
}

@end
