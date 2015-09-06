//
//  DragonView.h
//  lesson02
//
//  Created by snddfhv on 15/8/3.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragonViewDelegate.h"

@interface DragonView : UIView

@property(nonatomic, strong)UIImageView *dragonImageView;
// 声明一个实现了DragonViewDelegate协议的对象
@property(nonatomic, weak)id<DragonViewDelegate> delegate;

@end
