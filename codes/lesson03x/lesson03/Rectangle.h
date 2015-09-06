//
//  Rectangle.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject {
    int _width;
    int _height;
}

- (Rectangle *)initWithWidth:(int)width andHeight:(int)height;

- (void)setWidth:(int)width;

- (void)setHeight:(int)height;

- (void)setWidth:(int)width andHeight:(int)height;

- (int)width;

- (int)height;

@end
