//
//  CustomCell.h
//  uidemo
//
//  Created by snddfhv on 15/8/27.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellButton.h"

@protocol CustomCellDelegate;
@class CellButton;
@class Message;

@interface CustomCell : UITableViewCell {
    UILabel *_nameLabel;
    UILabel *_messageLabel;
    UILabel *_dateLabel;
}

@property (nonatomic, strong) CellButton *headButton;
@property (nonatomic, assign) id<CustomCellDelegate> delegate;

-(void)clearnComponents;

-(void)setComponentsWithMessage:(Message *)aMessage indexPath:(NSIndexPath *)indexPath;

-(void)setName:(NSString *)aName;

-(void)setMessage:(NSString *)aText;

-(void)setDate:(NSDate *)aDate;

-(void)setHeadImage:(UIImage *)aImage;

+(CGFloat)calculateCellHeightWithMessage:(Message *)aMessage;

@end


@protocol CustomCellDelegate <NSObject>

-(void)headButtonClicked:(CellButton *)headButton;

@end
