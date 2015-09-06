//
//  Complex.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Complex.h"

@implementation Complex

- (Complex *)initWithReal:(double)real andImaginary:(double)imaginary {
    self = [super init];
    if (self) {
        [self setReal:real andImaginary:imaginary];
    }
    return self;
}

- (void)setReal:(double)real andImaginary:(double)imaginary {
    _real = real;
    _imaginary = imaginary;
}

- (void)setReal:(double)real {
    _real = real;
}

- (void)setImaginary:(double)imaginary {
    _imaginary = imaginary;
}

- (double)real {
    return _real;
}

- (double)imaginary {
    return _imaginary;
}

- (void)print {
    printf("complex is %f / %f\n", _real, _imaginary);
}

@end
