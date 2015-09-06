//
//  Fraction.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

#pragma mark - realize Printing and NSCopying methods

- (void)print {
    printf("%i/%i\n", _numerator, _denominator);
}

- (Fraction *)copyWithZone:(NSZone *)zone {
    return [[Fraction allocWithZone:zone]initWithNumerator:_numerator andDenominator:_denominator];
}

#pragma mark - realize Fraction methods

- (void)setNumerator:(int)numerator {
    _numerator =  numerator;
}

- (void)setDenominator:(int)denominator {
    _denominator = denominator;
}

- (int)numerator {
    return _numerator;
}

- (int)denominator {
    return _denominator;
}

- (void)setNumerator:(int)numerator andDenominator:(int)denominator {
    _numerator = numerator;
    _denominator = denominator;
}

- (Fraction *)initWithNumerator:(int)numerator andDenominator:(int)denominator {
    self = [super init];
    if (self) {
        [self setNumerator:numerator andDenominator:denominator];
    }
    return self;
}

@end
