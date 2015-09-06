//
//  ThreeViewController.h
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ThreeViewController : BaseViewController<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIView *_contentView;
}

@end
