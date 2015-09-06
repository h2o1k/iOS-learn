//
//  DragonViewDelegate.h
//  lesson02
//
//  Created by snddfhv on 15/8/6.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

// 注意，这里用的是DragonView哦，声明这个类是存在的，而不用import是因为避免相互引用，因为在DragonView里也会引用这个的哦
@class DragonView;

@protocol DragonViewDelegate <NSObject>

// optional 说明这个方法是可选的
@optional
- (void)backButtonClicked:(DragonView *)dragonView;

// required 说明这个方法必须实现
@required
- (void)forwardButtonClicked:(DragonView *)dragonView;

@end
