//
//  DragonViewController.h
//  lesson02
//
//  Created by snddfhv on 15/8/3.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragonView.h"
#import "DragonViewDelegate.h"

@interface DragonViewController : UIViewController<DragonViewDelegate> {
    DragonView *_dragonView;
    UILabel *_dragonStatusLabel;
}

//@property(nonatomic, weak) DragonView *dragonView;
//@property(nonatomic, weak) UILabel  *dragonStatusLabel;


@end
