//
//  Utility.m
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(NSString *)getPathWithDocumentDir:(NSString *)aPath {
    // 完整的绝对路径
    NSString *fullPath = nil;
    // NSDocumentDirectory/NSLibraryDirectory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        fullPath = [paths objectAtIndex:0];
        if ([aPath length] > 0) {
            fullPath = [fullPath stringByAppendingPathComponent:aPath];
        }
    }
    return fullPath;
}

+(BOOL)createDirectory:(NSString *)dirPath lastComponentIsDirectory:(BOOL)isDir {
    NSString *path = nil;
    if (isDir) {
        path = dirPath;
    } else {
        path = [dirPath stringByDeletingLastPathComponent];
    }
    
    // 不存在
    if ([dirPath length] > 0 && [[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        NSError *error;
        BOOL ret = [[NSFileManager defaultManager] createDirectoryAtPath:path
                                             withIntermediateDirectories:YES
                                                              attributes:nil
                                                                   error:&error];
        if (!ret && error) {
            NSLog(@"create directory failed at path '%@', error:%@,%@", dirPath, [error localizedDescription], [error localizedFailureReason]);
            return NO;
        }
    }
    return YES;
}

+(BOOL)removeFile:(NSString *)filePath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            NSLog(@"remove file '%@' failed,reason:[%@]", filePath, [error localizedFailureReason]);
            return NO;
        }
    }
    return YES;
}

+(NSData *)archiverObject:(NSObject *)object forKey:(NSString *)key {
    if (object == nil) {
        return nil;
    }
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:object forKey:key];
    [archiver finishEncoding];
    return data;
}

+(NSObject *)unarchiverObject:(NSData *)archivedData withKey:(NSString *)key {
    if (archivedData == nil) {
        return nil;
    }
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:archivedData];
    NSObject *object = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];
    return object;
}

@end
