//
//  Utility.h
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

// 添加目录或文件并获得完整的Documents目录
+(NSString *)getPathWithDocumentDir:(NSString *)aPath;

// 创建目录
+(BOOL)createDirectory:(NSString *)dirPath lastComponentIsDirectory:(BOOL)isDir;

// 删除文件或目录
+(BOOL)removeFile:(NSString *)filePath;

// 归档
+(NSData *)archiverObject:(NSObject *)object forKey:(NSString *)key;

// 解档
+(NSObject *)unarchiverObject:(NSData *)archivedData withKey:(NSString *)key;

@end
