//
//  Square.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"

@interface Square : Rectangle

- (void)setSize:(int)size;

- (int)size;

- (Square *)initWithSize:(int)size;

@end
