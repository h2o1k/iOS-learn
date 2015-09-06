//
//  MultipartForm.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 */
@interface MultipartForm : NSObject {
    NSMutableArray *_fields;
    NSString *_boundaryString;
}

-(void)addValue:(id)value forField:(NSString *)field;

-(NSData *)httpBody;

-(NSString *)boundary;

-(NSString *)contentType;

-(NSString *)getRandomBoundary;

@end
