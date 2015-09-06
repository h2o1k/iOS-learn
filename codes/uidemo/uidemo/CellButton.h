//
//  CellButton.h
//  uidemo
//
//  Created by snddfhv on 15/8/27.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellButton : UIButton {
    // 扩充两个属性
    NSInteger _cellSelection;
    NSInteger _cellRow;
}

@property (nonatomic, assign) NSInteger cellSelection;
@property (nonatomic, assign) NSInteger cellRow;

@end
