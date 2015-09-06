//
//  Rectangle.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (Rectangle *)initWithWidth:(int)width andHeight:(int)height {
    self = [super init];
    if (self) {
        [self setWidth:width andHeight:height];
    }
    return self;
}

- (void)setWidth:(int)width {
    _width = width;
}

- (void)setHeight:(int)height {
    _height = height;
}

- (void)setWidth:(int)width andHeight:(int)height {
    _width = width;
    _height = height;
}

- (int)width {
    return _width;
}

- (int)height {
    return _height;
}

@end
