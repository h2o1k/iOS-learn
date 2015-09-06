//
//  User.h
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    NSString *_name;
    NSString *_headImagePath;
    NSString *_lifePhotoPath;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *headImagePath;
@property (nonatomic, copy) NSString *lifePhotoPath;

+ (User *)userWithName:(NSString *)aName headImagePath:(NSString *)aHeadImagePath lifePhotoPath:(NSString *)aLifePhotoPath;

@end
