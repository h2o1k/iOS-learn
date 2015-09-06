//
//  Complex.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printing.h"

@interface Complex : NSObject<Printing> {
    double _real;
    double _imaginary;
}

- (Complex *)initWithReal:(double)real andImaginary:(double)imaginary;

- (void)setReal:(double)real;

- (void)setImaginary:(double)imaginary;

- (double)real;

- (double)imaginary;

- (void)setReal:(double)real andImaginary:(double)imaginary;

// - (void)print;

@end
