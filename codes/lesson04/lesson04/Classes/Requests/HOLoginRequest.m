//
//  HOLoginRequest.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOLoginRequest.h"
#import "MultipartForm.h"
#import "HOLoginRequestParser.h"

@implementation HOLoginRequest

#pragma mark - Custom methods

-(void)sendLoginRequestWithUserName:(NSString *)userName password:(NSString *)password delegate:(id<HOLoginRequestDelegate>)delegate {
    [self cancelRequest];
    
    NSString *urlString = @"http://test.h2o1k.net/login.xml";
    
    self.delegate = delegate;
    
    /** POST请求 */
    // 一定要对url进行编码，否则不支持中文
    NSString *encodedUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // NSLog(@"%@", encodedUrlString);
    NSURL *url = [NSURL URLWithString:encodedUrlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60; // 请求超时时间
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 缓存机制
    MultipartForm *form = [[MultipartForm alloc] init];
    [form addValue:userName forField:@"userName"];
    [form addValue:password forField:@"password"];
    request.HTTPBody = [form httpBody];
    // NSString *string = [[NSString alloc] initWithData:[form httpBody] encoding:NSUTF8StringEncoding];
    // NSLog(@"%@", string);
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];

    
    
    /** GET请求
    urlString = [NSString stringWithFormat:@"%@?userName=%@&password=%@", urlString, userName, password];
    // 一定要对url进行编码，否则不支持中文
    NSString *encodedUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", encodedUrlString);
    NSURL *url = [NSURL URLWithString:encodedUrlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 60; // 请求超时时间
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 缓存机制
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
     */
}

-(void)cancelRequest {
    if (self.urlConnection) {
        [self.urlConnection cancel];
        self.urlConnection = nil;
    }
}

#pragma mark - Implements NSURLConnectionDataDelegate methods

// 连接服务器，收到服务器响应，判断是否能够连通
-(void)connection:(nonnull NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {  // 请求成功
        self.receivedData = [NSMutableData data];
    } else { // 请求失败
        NSLog(@"请求失败啦 %ld", httpResponse.statusCode);
    }
}

// 传输数据，这个方法可能会调用多次
-(void)connection:(nonnull NSURLConnection *)connection didReceiveData:(nonnull NSData *)data {
    [self.receivedData appendData:data];
}

// 上传数据，这个方法很少用
-(void)connection:(nonnull NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
    
}

// 传输数据完成时调用
-(void)connectionDidFinishLoading:(nonnull NSURLConnection *)connection {
    NSString *string = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    // NSLog(@"HOLoginRequest-connectionDidFinishLoading:\n%@", string);
    HOLoginRequestParser *parser = [[HOLoginRequestParser alloc] init];
    // HOUser *user = [parser parseJson:self.receivedData];
    HOUser *user = [parser parseXML:self.receivedData];
    
    if (user) {
        if ([self.delegate respondsToSelector:@selector(requestSuccess:user:)]) {
            [self.delegate requestSuccess:self user:user];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(requestFail:error:)]) {
            [self.delegate requestFail:self error:[NSError errorWithDomain:@"解析出错啦" code:120 userInfo:nil]];
        }
    }
    

}

// 连接失败
-(void)connection:(nonnull NSURLConnection *)connection didFailWithError:(nonnull NSError *)error {
    NSLog(@"error:%@", error);
    if ([self.delegate respondsToSelector:@selector(requestFail:error:)]) {
        [self.delegate requestFail:self error:error];
    }
}

@end
