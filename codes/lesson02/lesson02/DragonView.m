//
//  DragonView.m
//  lesson02
//
//  Created by snddfhv on 15/8/3.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "DragonView.h"

@implementation DragonView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor yellowColor]];
        
        // 画龙
        _dragonImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        _dragonImageView.image = [UIImage imageNamed:@"dragon.png"];
        _dragonImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_dragonImageView];
        
        // 画后退按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(10, _dragonImageView.bounds.size.height+10, 50, 50); // 设置位置及大小
        backButton.backgroundColor = [UIColor clearColor];
        [backButton setImage:[UIImage imageNamed:@"back.png"] forState:(UIControlStateNormal)]; // 设置背景图片
        [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];

        // 画前进按钮
        UIButton *forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        forwardButton.frame = CGRectMake(frame.size.width-10-50, _dragonImageView.bounds.size.height + 10, 50, 50);
        forwardButton.backgroundColor = [UIColor clearColor];
        [forwardButton setImage:[UIImage imageNamed:@"forward.png"] forState:UIControlStateNormal];
        [forwardButton addTarget:self action:@selector(forwardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forwardButton];
        
        
    }
    return self;
}

#pragma mark - Custom event methods

- (void)backButtonClicked:(id)sender {
    CGFloat x = _dragonImageView.frame.origin.x - 10;
    if (x > 0) {
        _dragonImageView.frame = CGRectMake(x, _dragonImageView.frame.origin.y, _dragonImageView.frame.size.width, _dragonImageView.frame.size.height);
    }
    
    if ([_delegate respondsToSelector:@selector(backButtonClicked:)]) {
        [_delegate backButtonClicked:self];
    }
}

- (void)forwardButtonClicked:(id)sender {
    CGFloat x = _dragonImageView.frame.origin.x + 10;
    if (x < self.frame.size.width - 100) {
        _dragonImageView.frame = CGRectMake(x, _dragonImageView.frame.origin.y, _dragonImageView.frame.size.width, _dragonImageView.frame.size.height);
    }
    if ([_delegate respondsToSelector:@selector(forwardButtonClicked:)]) {
        [_delegate forwardButtonClicked:self];
    }
}

@end
