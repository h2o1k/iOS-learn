//
//  HOUserInfoViewController.m
//  lesson04
//
//  Created by snddfhv on 15/9/5.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOUserInfoViewController.h"
#import "HOGlobal.h"
#import "HOImageDownloader.h"

@interface HOUserInfoViewController ()<HOImageDownloaderDelegate> {
    HOImageDownloader *_downloader;
    BOOL _isDownloading;
}

@end

@implementation HOUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    self.title = @"用户信息";
    
    self.headImageHeightConstraint.constant = 136;
    _downloadProgressView.progress = 0;
    
    self.userInfoLabel.text = [HOGlobal shareGlobal].user.userName;
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Custom methods
- (IBAction)downloadButtonClicked:(id)sender {
    NSLog(@"下载用户头像操作");
    if (_isDownloading) {
        return;
    }
    _isDownloading = YES;
    _downloadProgressView.progress = 0;
    [_activityView startAnimating];
    
    if (_downloader == nil) {
        _downloader = [[HOImageDownloader alloc] init];
        _downloader.delegate = self;
    }
    [_downloader download:[HOGlobal shareGlobal].user.headImageUrl delegate:self];
}

#pragma mark - HOImageDownloaderDelegate methods

// 下载成功
-(void)downloadSuccess:(HOImageDownloader *)downloader data:(NSData *)data {
    [_activityView stopAnimating];
    _isDownloading = NO;
    _headImageView.image = [[UIImage alloc] initWithData:data];
}

// 下载失败
-(void)downloadFailed:(HOImageDownloader *)downloader error:(NSError *)error {
    [_activityView stopAnimating];
    _isDownloading = NO;
    NSLog(@"%@", error);
}

// 接收数据
-(void)downloadReceivedData:(HOImageDownloader *)downloader {
    //  NSLog(@"%ld", [downloader.receivedData length]);
    _downloadProgressView.progress = [downloader.receivedData length]/(double)downloader.totalLength;
}
@end
