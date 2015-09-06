//
//  Person.h
//  lesson01
//
//  Created by snddfhv on 15/7/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;

- (id) initWithName:(NSString *) name age:(NSInteger) age;

- (void) sayMyInfo;

+ (void) printMessage:(NSString *) message;


@end
