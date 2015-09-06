//
//  FractionMath.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "FractionMath.h"

@implementation Fraction(Math)

- (Fraction *)add:(Fraction *)f {
    return [[Fraction alloc]initWithNumerator:_numerator*[f denominator] + [f numerator] * _denominator
                               andDenominator:_denominator * [f denominator]];
}

- (Fraction *)mul:(Fraction *)f {
    return [[Fraction alloc]initWithNumerator:_numerator*[f numerator]
                               andDenominator:_denominator*[f denominator] ];
}

- (Fraction *)div:(Fraction *)f {
    return [[Fraction alloc]initWithNumerator:_numerator*[f denominator]
                               andDenominator:_denominator*[f numerator]];
}

- (Fraction *)sub:(Fraction *)f {
    return [[Fraction alloc]initWithNumerator:_numerator*[f denominator] - [f numerator] * _denominator
                               andDenominator:_denominator * [f denominator]];
}


@end
