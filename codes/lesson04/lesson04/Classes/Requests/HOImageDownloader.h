//
//  HOImageDownloader.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HOImageDownloaderDelegate;

@interface HOImageDownloader : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic, strong)NSURLConnection *urlConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, assign)long long totalLength;
@property(nonatomic, assign)id<HOImageDownloaderDelegate> delegate;

-(void)download:(NSString *)urlString delegate:(id<HOImageDownloaderDelegate>)delegate;

-(void)cancel;

@end

@protocol HOImageDownloaderDelegate <NSObject>

-(void)downloadSuccess:(HOImageDownloader *)downloader data:(NSData *)data;
-(void)downloadFailed:(HOImageDownloader *)downloader error:(NSError *)error;
// 更新进度条
-(void)downloadReceivedData:(HOImageDownloader *)downloader;

@end
