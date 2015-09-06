//
//  HOLoginRequest.h
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HOUser.h"

@protocol HOLoginRequestDelegate;

@interface HOLoginRequest : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic, strong)NSURLConnection *urlConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, assign)id<HOLoginRequestDelegate> delegate;

// 登录请求
-(void)sendLoginRequestWithUserName:(NSString *)userName password:(NSString *)password delegate:(id<HOLoginRequestDelegate>) delegate;

// 取消请求
-(void)cancelRequest;

@end

@protocol HOLoginRequestDelegate <NSObject>

-(void)requestSuccess:(HOLoginRequest *)request user:(HOUser *)user;

-(void)requestFail:(HOLoginRequest *)request error:(NSError *)error;

@end
