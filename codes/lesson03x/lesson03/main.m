//
//  main.m
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "Fraction.h"
#import "FractionMath.h"
#import "Access.h"
#import "Cup.h"
#import "CupWarningException.h"
#import "CupOverflowException.h"
#import "Complex.h"
#import "Rectangle.h"
#import "Square.h"
#import <Foundation/NSException.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSString.h>
#import <Foundation/NSAutoreleasePool.h>
#import <stdio.h>

void printDic(NSDictionary *dic) {
    NSEnumerator *enumerator = [dic keyEnumerator];
    id key;
    while ((key=[enumerator nextObject]) != nil) {
        printf("%s=>%s\n", [[key description]cString], [[[dic objectForKey:key]description]cString]);
    }
}

void printArray(NSArray *array) {
    NSEnumerator *enumerator = [array objectEnumerator];
    id obj;
    // while (obj = [enumerator nextObject]) {
    while ((obj = [enumerator nextObject])!=nil) {
        printf("%s\n", [[obj description]cString]);
    }
}

void test001() {
    NSArray *array = [[NSArray alloc]initWithObjects:@"me", @"Myself", @"I", nil];
    NSMutableArray *mutable = [[NSMutableArray alloc]init];
    
    printf(">>>>>>>>>>>>>>>>>>>>>>print array\n");
    printArray(array);
    
    [mutable addObject:@"One"];
    [mutable addObject:@"Two"];
    [mutable addObjectsFromArray:array];
    [mutable addObject:@"Three"];
    printf(">>>>>>>>>>>>>>>>>>>>>>print mutable array\n");
    printArray(mutable);
    
    [mutable sortUsingSelector:@selector(caseInsensitiveCompare:)];
    printf(">>>>>>>>>>>>>>>>>>>>>>sorted mutable array\n");
    printArray(mutable);
    
    NSDictionary *dictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                @"one",[NSNumber numberWithInt:1],
                                @"two",[NSNumber numberWithInt:2],
                                @"three",[NSNumber numberWithInt:3],
                                nil];
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc]init];
    
    printf(">>>>>>>>>>>>>>>>>>>>>>print dictionary\n");
    printDic(dictionary);
    
    [mutableDic setObject:@"Tom" forKey:@"tom@jones.com"];
    [mutableDic  setObject:@"Bob" forKey:@"bob@dole.com"];
    printf(">>>>>>>>>>>>>>>>>>>>>>print mutable dictionary\n");
    printDic(mutableDic);
}
/**
 Fraction:分数
 Complex:复数
 Printing:可打印，代理
 */
void testProtocol() {
    Fraction *frac = [[Fraction alloc]initWithNumerator:3 andDenominator:4];
    Complex *comp = [[Complex alloc]initWithReal:2.1 andImaginary:3.3];
    
    id<Printing> printable;
    id<NSCopying, Printing> copyPrintable;
    
    printf("frac print:\n");
    printable = frac;
    [printable print];
    
    printf("comp print:\n");
    printable = comp;
    [printable print];
    
    copyPrintable = frac;
    
    printf("Fraction confroms to NSCopying: ");
    if ([frac conformsToProtocol:@protocol(NSCopying)]) {
        printf("true");
    } else {
        printf("false");
    }
    
    printf("\nComplex confroms to NSCopying: ");
    if ([comp conformsToProtocol:@protocol(NSCopying)]) {
        printf("true");
    } else {
        printf("false");
    }
}

void testCategory() {
    Fraction *f1 = [[Fraction alloc]initWithNumerator:3 andDenominator:4];
    Fraction *f2 = [[Fraction alloc]initWithNumerator:2 andDenominator:3];
    Fraction *f3 = [f1 add:f2];
    [f3 print];
    f3 = [f1 mul:f2];
    [f3 print];
    f3 = [f1 div:f2];
    [f3 print];
    f3 = [f1 sub:f2];
    [f3 print];
}

void testDynamicTypes() {
    /*
     -(BOOL) isKindOfClass: classObj
     -(BOOL) isMemberOfClass: classObj
     -(BOOL) respondsToSelector: selector
     +(BOOL) instancesRespondToSelector: selector
     -(id) performSelector: selector
     */
    
    // Square:Rectangel:NSObject
    Square *sq = [[Square alloc]initWithSize:10];
    // Rectangle *re = [[Rectangle alloc]initWithWidth:3 andHeight:4];
    
    // iskindOfClass
    printf("\nsquare isKindOfClass Square\t\t");
    if ([sq isKindOfClass:[Square class]]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nsquare isKindOfClass Rectangle\t");
    if ([sq isKindOfClass:[Rectangle class]]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nsquare isKindOfClass NSObject\t");
    if ([sq isKindOfClass:[NSObject class]]) {
        printf("true");
    } else {
        printf("false");
    }
    
    // isMemberOfClass
    printf("\nsquare isMemberOfClass Square\t");
    if ([sq isMemberOfClass:[Square class]]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nsquare isMemberOfClass Rectangle\t");
    if ([sq isMemberOfClass:[Rectangle class]]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nsquare isMemberOfClass NSObject\t");
    if ([sq isMemberOfClass:[NSObject class]]) {
        printf("true");
    } else {
        printf("false");
    }
    
    // respondsToSelector
    printf("\nsq respondsToSelector setSize:\t");
    if ([sq respondsToSelector:@selector(setSize:)]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nSquare respondsToSelector alloc:\t");
    if ([Square respondsToSelector:@selector(alloc)]) {
        printf("true");
    } else {
        printf("false");
    }
    printf("\nSquare instancesRespondToSelector setSize:\t");
    if ([Square instancesRespondToSelector:@selector(setSize:)]) {
        printf("true");
    } else {
        printf("false");
    }
}

void testException() {
    // NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
    
    Cup *cup = [[Cup alloc]init];
    
    for (int i=0; i<4; i++) {
        [cup fill];
        [cup print];
    }
    
    for (int i=0; i<7; i++) {
        @try {
            [cup fill];
        }
        @catch (CupWarningException *e) {
            printf("%s:", [[e name]cString]);
        }
        @catch (CupOverflowException *e) {
            printf("%s:", [[e name]cString]);
        }
        @finally {
            [cup print];
        }
    }
    
    @try {
        [cup setLevel:-1];
    }
    @catch (CupOverflowException *e) {
        printf("%s:%s", [[e name]cString], [[e reason]cString]);
    }
    
    
    
    // [cup release];
    // [pool release];
}

void testAccess() {
    Access *access = [[Access alloc]init];
    
    access->publicVar = 1;
    printf("publicVar is %i\n", access->publicVar);
    
    // access->protectedVar = 2;
    // access->privateVar = 4;
    
    printf("count is %i\n", [Access initCount]);
    
    Access *access2 = [[Access alloc]init];
    printf("count is %i\n", [Access initCount]);
    access2->publicVar = 3;
}

void testFraction() {
    // create instance
    Fraction *fraction = [[Fraction alloc]init];
    Fraction *fraction2 = [[Fraction alloc]init];
    Fraction *fraction3 = [[Fraction alloc]initWithNumerator:3 andDenominator:4];
    
    // set instance variables
    [fraction setNumerator:1];
    [fraction setDenominator:3];
    [fraction2 setNumerator:2 andDenominator:3];
    
    // print it
    printf("the fraction is ");
    [fraction print];
    printf("the fraction2 is ");
    [fraction2 print];
    printf("the fraction3 is ");
    [fraction3 print];
}

int main(int argc, const char * argv[]) {
    
    testProtocol();
    
    
    printf("\n");
    return 0;
}
