//
//  HOLoginRequestParser.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOUser.h"

@interface HOLoginRequestParser : NSObject<NSXMLParserDelegate> {
    HOUser *_user;
    HOAddress *_address;
    NSMutableString *_currentValue;
}

-(HOUser *)parseJson:(NSData *)data;

-(HOUser *)parseXML:(NSData *)data;

@end
