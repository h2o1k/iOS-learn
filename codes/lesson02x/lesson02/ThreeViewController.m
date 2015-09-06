//
//  ThreeViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"Three";
    NSLog(@"%@ viewDidLoad", self.title);
    self.bgImageView.image = [UIImage imageNamed:@"bg3"];
    
    /** 常用组件之UIScrollView */
    // 关系相当之复杂啊：：：Window<-_scrollView<-_contentView<-view<-imageView
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat scrollViewWidth = width - 20;
    CGFloat scrollViewHeight = height - 64 - 49 - 37 - 10;
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 74, scrollViewWidth, scrollViewHeight)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(scrollViewWidth * 5, scrollViewHeight); // 设置滚动的内容的大小
    _scrollView.pagingEnabled = YES; // 可以放大缩小
    _scrollView.maximumZoomScale = 3; // 最大放大倍数
    _scrollView.minimumZoomScale = 0.5; // 最小缩小倍数
    _scrollView.delegate = self;
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scrollViewWidth * 5, scrollViewHeight)];
    _contentView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:_contentView];
    
    for (int i=0; i<5; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)];
        view.backgroundColor = [UIColor blackColor];
        [_contentView addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
        imageView.backgroundColor = [UIColor clearColor];
        NSString *imageName = [NSString stringWithFormat:@"bg%i.png", i+1];
        imageView.image =[UIImage imageNamed:imageName];
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 + 80, scrollViewWidth, scrollViewHeight)];
        label.font = [UIFont boldSystemFontOfSize:100];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"%i", i+1];
        [view addSubview:label];
    }
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, _scrollView.frame.origin.y + scrollViewHeight, scrollViewWidth, 37)];
    _pageControl.numberOfPages = 5;
    [_pageControl addTarget:self
                     action:@selector(pageControlClicked:)
           forControlEvents:UIControlEventValueChanged];
    //    _pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:_pageControl];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Custom event methods

- (void)pageControlClicked:(UIPageControl *)pageControl {
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    // NSLog(@"currentPage %li", (long)pageControl.currentPage);
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage * scrollViewWidth, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _contentView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    _pageControl.currentPage = scrollView.contentOffset.x / scrollViewWidth;
}

#pragma mark - memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end
