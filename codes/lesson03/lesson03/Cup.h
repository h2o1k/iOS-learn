//
//  Cup.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cup : NSObject {
    int _level;
}

- (int)level;

- (void)setLevel:(int)level;

- (void)fill;

- (void)empty;

- (void)print;

@end
