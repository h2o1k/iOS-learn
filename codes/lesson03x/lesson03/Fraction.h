//
//  Fraction.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printing.h"

@interface Fraction : NSObject<Printing, NSCopying> {
    int _numerator;
    int _denominator;
}

// - (void)print;
- (void)setNumerator:(int)numerator;
- (void)setDenominator:(int)denominator;
- (int)numerator;
- (int)denominator;
- (void)setNumerator:(int)numerator andDenominator:(int)denominator;
- (Fraction *)initWithNumerator:(int)numerator andDenominator:(int)denominator;


@end
