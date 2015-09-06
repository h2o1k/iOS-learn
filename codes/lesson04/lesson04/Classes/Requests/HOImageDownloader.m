//
//  HOImageDownloader.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOImageDownloader.h"

@implementation HOImageDownloader

-(void)download:(NSString *)urlString delegate:(id<HOImageDownloaderDelegate>)delegate {
    [self cancel];
    
    self.delegate = delegate;
    NSString *encodedUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedUrlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

-(void)cancel {
    if (self.urlConnection) {
        [self.urlConnection cancel];
    }
    self.urlConnection = nil;
}

#pragma mark - NSURLConnectionDataDelegate methods
// 客户端进行请求，服务器端的回应
-(void)connection:(nonnull NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response {
    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
    if (httpURLResponse.statusCode == 200) {
        self.totalLength = httpURLResponse.expectedContentLength;
        self.receivedData = [NSMutableData data];
    }
}

// 接收数据
-(void)connection:(nonnull NSURLConnection *)connection didReceiveData:(nonnull NSData *)data {
    [self.receivedData appendData:data];
    if ([_delegate respondsToSelector:@selector(downloadReceivedData:)]) {
        [_delegate downloadReceivedData:self];
    }
}

// 数据传输完成
-(void)connectionDidFinishLoading:(nonnull NSURLConnection *)connection {
    if ([_delegate respondsToSelector:@selector(downloadSuccess:data:)]) {
        [_delegate downloadSuccess:self data:self.receivedData];
    }
}

// 连接错误
-(void)connection:(nonnull NSURLConnection *)connection didFailWithError:(nonnull NSError *)error {
    if ([_delegate respondsToSelector:@selector(downloadFailed:error:)]) {
        [_delegate downloadFailed:self error:error];
    }
}

@end
