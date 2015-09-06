//
//  Access.h
//  lesson03
//
//  Created by snddfhv on 15/8/2.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

static int count;

@interface Access : NSObject {

@public
    int publicVar;
    
@private
    int privateVar;
    int privateVar2;

@protected
    int protectedVar;
}

+ (int)initCount;
+ (void)initialize;

@end
