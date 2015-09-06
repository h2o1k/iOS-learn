//
//  FractionMath.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Fraction.h"

@interface Fraction(Math)

- (Fraction *)add:(Fraction *)f;

- (Fraction *)mul:(Fraction *)f;

- (Fraction *)div:(Fraction *)f;

- (Fraction *)sub:(Fraction *)f;

@end
