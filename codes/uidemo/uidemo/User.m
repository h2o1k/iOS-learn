//
//  User.m
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name = _name;
@synthesize headImagePath = _headImagePath;
@synthesize lifePhotoPath = _lifePhotoPath;

+ (User *)userWithName:(NSString *)aName headImagePath:(NSString *)aHeadImagePath lifePhotoPath:(NSString *)aLifePhotoPath {
    User *user = [[User alloc]init];
    user.name = aName;
    user.headImagePath = aHeadImagePath;
    user.lifePhotoPath = aLifePhotoPath;
    return user;
}

- (void)dealloc {
    self.name = nil;
    self.headImagePath = nil;
    self.lifePhotoPath = nil;
}

@end
