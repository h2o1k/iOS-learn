//
//  CustomCell.m
//  uidemo
//
//  Created by snddfhv on 15/8/27.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "CustomCell.h"
#import "Message.h"

@interface CustomCell() {
    CGFloat _cellWidth;
}

@end

@implementation CustomCell

- (void)awakeFromNib {
}

#pragma mark - override UITableViewCell methods

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellWidth = [UIScreen mainScreen].bounds.size.width;
        
        // 头像
        self.headButton = [[CellButton alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        self.headButton.backgroundColor = [UIColor clearColor];
        [self.headButton addTarget:self
                            action:@selector(headButtonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.headButton];
        
        // 名字
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, _cellWidth - 70, 22)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blueColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        
        // 信息内容
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_messageLabel];
        
        // 日期
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.textColor = [UIColor grayColor];
        _dateLabel.font = [UIFont systemFontOfSize:13];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_dateLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - custom event methods

-(void)headButtonClicked:(CellButton *)sender {
    if (_delegate && [(NSObject *)_delegate respondsToSelector:@selector(headButtonClicked:)]) {
        [_delegate headButtonClicked:sender];
    }
}

#pragma mark - CustomCell methods

-(void)clearnComponents {
    [_headButton setBackgroundImage:nil forState:UIControlStateNormal];
    [_headButton setBackgroundImage:nil forState:UIControlStateHighlighted];
    _nameLabel.text = nil;
    _messageLabel.text = nil;
    _dateLabel.text = nil;
}

-(void)setComponentsWithMessage:(Message *)aMessage indexPath:(NSIndexPath *)indexPath {
    _headButton.cellSelection = indexPath.section;
    _headButton.cellRow = indexPath.row;
    
    [self clearnComponents];
    [self setName:aMessage.sender.name];
    [self setMessage:aMessage.text];
    [self setDate:aMessage.sendDate];
}

-(void)setName:(NSString *)aName {
    _nameLabel.text = aName;
}

-(void)setMessage:(NSString *)aText {
    CGFloat textWidth = _cellWidth - 70;
    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],}
                                          context:nil].size;
    _messageLabel.frame = CGRectMake(60, 32, textSize.width, textSize.height);
    _messageLabel.text = aText;
}

-(void)setDate:(NSDate *)aDate {
    CGFloat textWidth = _cellWidth - 70;
    CGFloat originY = _messageLabel.frame.origin.y + _messageLabel.frame.size.height + 5;
    _dateLabel.frame = CGRectMake(60, originY, textWidth, 18);
    _dateLabel.text = [NSString stringWithFormat:@"%@", aDate];
}

-(void)setHeadImage:(UIImage *)aImage {
    [_headButton setBackgroundImage:aImage forState:UIControlStateNormal];
}

+(CGFloat)calculateCellHeightWithMessage:(Message *)aMessage {
    CGFloat textWidth = [UIScreen mainScreen].bounds.size.width - 70;
    CGSize textSize = [aMessage.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],}
                                                  context:nil].size;
    CGFloat height = textSize.height + 32 + 5 + 18 + 5;
    return height;
}

@end
