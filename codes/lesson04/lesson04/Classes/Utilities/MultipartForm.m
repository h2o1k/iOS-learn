//
//  MultipartForm.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "MultipartForm.h"

@implementation MultipartForm
- (id)init {
    if( (self = [super init]) ) {
        _fields = [[NSMutableArray alloc] init];
        _boundaryString = [self getRandomBoundary];
    }
    return self;
}

- (NSString *)getRandomBoundary {
    NSMutableString *boundaryString = [NSMutableString string];
    [boundaryString appendString:@"__Boundary"];
    [boundaryString appendFormat:@"%d",arc4random()];
    [boundaryString appendString:@"__"];
    
    return boundaryString;
}


- (void)addValue:(id)value forField:(NSString *)field {
    if (!value) {
        value = @"";
    }
    if (!field) {
        field = @"";
    }
    [_fields addObject:[NSArray arrayWithObjects:value,field,nil]];
}

- (NSString *) boundary {
    return _boundaryString;
}

- (NSString *) contentType {
    return [NSString stringWithFormat:@"multipart/form-data; boundaryData=%@",_boundaryString];
}

- (NSData *)httpBody {
    NSData *boundaryData = [[NSString stringWithFormat:@"--%@\r\n", _boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *body = [NSMutableData dataWithData:boundaryData];
    
    NSEnumerator *en = [_fields objectEnumerator];
    NSArray *kv;
    
    BOOL isFile;
    id v;
    NSString *k, *fn;
    NSRange r;
    while( (kv = [en nextObject]) ) {
        v = [kv objectAtIndex:0];
        k = [kv objectAtIndex:1];
        isFile = NO;
        if([v isKindOfClass:[NSString class]]) {
            r = [k rangeOfString:@"@"];
            if(r.location == 0) {
                k = [k substringFromIndex:1];
                fn = v;
                v = [NSData dataWithContentsOfFile:v];
                isFile = YES;
                if(!v)
                    return nil;
            } else {
                v = [v dataUsingEncoding:NSUTF8StringEncoding];
            }
        } else {
            v = [[v description] dataUsingEncoding:NSUTF8StringEncoding];
        }
        
        if(isFile) {
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", k, [fn lastPathComponent]] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        } else {
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", k] dataUsingEncoding:NSUTF8StringEncoding]];
        }
        
        [body appendData:v];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:boundaryData];
    }
    
    return body;
}
@end
