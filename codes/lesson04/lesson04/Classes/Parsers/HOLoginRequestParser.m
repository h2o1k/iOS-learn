//
//  HOLoginRequestParser.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOLoginRequestParser.h"

@implementation HOLoginRequestParser 

-(HOUser *)parseJson:(NSData *)data {
    
    
    NSError *error = nil;
    // data->jsonDictionary
    id jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"解析出错啦");
    } else {
        if ([[jsonDictionary class] isSubclassOfClass:[NSDictionary class]]) {
            // jsonDictionary->userDictionary
            id userDictionary = [jsonDictionary valueForKey:@"user"];
            if ([[userDictionary class] isSubclassOfClass:[NSDictionary class]]) {
                HOUser *user = [[HOUser alloc] init];
                // userId
                id userId = [userDictionary valueForKey:@"id"];
                if ([[userId class] isSubclassOfClass:[NSString class]]) {
                    user.userId = (NSString *)userId;
                }
                // userName
                id userName = [userDictionary valueForKey:@"userName"];
                if ([[userName class] isSubclassOfClass:[NSString class]]) {
                    user.userName = (NSString *)userName;
                }
                // age
                id age = [userDictionary valueForKey:@"age"];
                if ([[age class] isSubclassOfClass:[NSNumber class]]) {
                    user.age = [(NSNumber *)age integerValue];
                }
                // headImageUrl
                id headImageUrl = [userDictionary valueForKey:@"headImageUrl"];
                if ([[headImageUrl class] isSubclassOfClass:[NSString class]]) {
                    user.headImageUrl = (NSString *)headImageUrl;
                }
                // address
                id addressDictionary = [userDictionary valueForKey:@"address"];
                if ([[addressDictionary class] isSubclassOfClass:[NSDictionary class]]) {
                    HOAddress *address = [[HOAddress alloc] init];
                    // cityId
                    id cityId = [addressDictionary valueForKey:@"id"];
                    if ([[cityId class] isSubclassOfClass:[NSString class]]) {
                        address.cityId = (NSString *)cityId;
                    }
                    // city
                    id city = [addressDictionary valueForKey:@"city"];
                    if ([[city class] isSubclassOfClass:[NSString class]]) {
                        address.city = (NSString *)city;
                    }
                    user.address = address;
                }
                return user;
            }

        }
    }
    
    return nil;
}

-(HOUser *)parseXML:(NSData *)data {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    NSError *error = [parser parserError];
    if (error) {
        //
    } else {
        _currentValue = [NSMutableString string];
        parser.delegate = self;
        [parser parse];
        return _user;
    }
    return nil;
}

#pragma mark - NSXMLParserDelegate methods

// 找到开始节点
-(void)parser:(nonnull NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"user"]) {
        _user = [[HOUser alloc] init];
    } else if ([elementName isEqualToString:@"address"]) {
        _address = [[HOAddress alloc] init];
    }
    [_currentValue setString:@""];
}

// 找到结束节点
-(void)parser:(nonnull NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName {
    if ([elementName isEqualToString:@"userName"]) {
        _user.userName = _currentValue;
    } else if ([elementName isEqualToString:@"age"]) {
        _user.age = [_currentValue integerValue];
    } else if ([elementName isEqualToString:@"headImageUrl"]) {
        _user.headImageUrl = _currentValue;
    } else if ([elementName isEqualToString:@"address"]) {
        _user.address = _address;
        _address = nil;
    } else if ([elementName isEqualToString:@"city"]) {
        _address.city = _currentValue;
    } else if ([elementName isEqualToString:@"id"]) {
        if (_address) {
            _address.cityId = _currentValue;
        } else {
            _user.userId = _currentValue;
        }
    }
}

// 找到节点中间的内容
-(void)parser:(nonnull NSXMLParser *)parser foundCharacters:(nonnull NSString *)string {
    [_currentValue setString:string];
}

@end
