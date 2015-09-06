//
//  MessageListViewController.m
//  uidemo
//
//  Created by snddfhv on 15/8/26.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "MessageListViewController.h"

@interface MessageListViewController ()

@end

@implementation MessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    _messageArray = [[NSMutableArray alloc] initWithCapacity:5];
    [self createMessageData];
    self.navigationItem.title = @"信息列表";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(editButtonClicked:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - custom event methods
- (void)editButtonClicked:(UIBarButtonItem *)editButton {
    _tableView.editing = !_tableView.editing;
    if (_tableView.editing) {
        [editButton setTitle:@"完成"];
    } else {
        [editButton setTitle:@"编辑"];
    }
}

#pragma mark - custom methods

- (void)createMessageData {
    // mainBundle可理解为项目目录
    
    // Steve Jobs
    User *steve_jobs = [User userWithName:@"Steve Jobs"
                            headImagePath:[[NSBundle mainBundle] pathForResource:@"headImage1" ofType:@"png"]
                            lifePhotoPath:[[NSBundle mainBundle] pathForResource:@"jobs" ofType:@"png"]];
    [_messageArray addObject:[Message messageWithSender:steve_jobs
                                                  text:@"乔布斯被认为是计算机业界与娱乐业界的标志性人物，他经历了苹果公司几十年的起落与兴衰，先后领导和推出了麦金塔计算机（Macintosh）、iMac、iPod、iPhone、iPad等风靡全球的电子产品，深刻地改变了现代通讯、娱乐、生活方式。乔布斯同时也是前Pixar动画公司的董事长及行政总裁。"
                                              sendDate:[NSDate date]]];
    // 李小龙
    User *li = [User userWithName:@"李小龙"
                            headImagePath:[[NSBundle mainBundle] pathForResource:@"headImage2" ofType:@"png"]
                            lifePhotoPath:[[NSBundle mainBundle] pathForResource:@"li" ofType:@"png"]];
    [_messageArray addObject:[Message messageWithSender:li
                                                   text:@"李小龙，原名李振藩，1940年出生于美国加州旧金山，祖籍中国广东顺德均安镇。他是世界武道变革先驱者、武术技击家、武术哲学家、UFC开创者、MMA之父、武术宗师、功夫片的开创者和截拳道创始人、华人武打电影演员，中国功夫首位全球推广者、好莱坞首位华人演员。他在香港的四部半电影3次打破多项记录，其中《猛龙过江》打破了亚洲电影票房记录，与好莱坞合作的《龙争虎斗》全球总票房达2.3亿美元。"
                                               sendDate:[NSDate date]]];
    // 成龙
    User *cheng = [User userWithName:@"成龙"
                       headImagePath:[[NSBundle mainBundle] pathForResource:@"headImage3" ofType:@"png"]
                       lifePhotoPath:[[NSBundle mainBundle] pathForResource:@"cheng" ofType:@"png"]];
    [_messageArray addObject:[Message messageWithSender:cheng
                                                   text:@"成龙，1954年4月7日生于香港中西区，祖籍安徽芜湖，[1]  国家一级演员，大中华区影坛和国际功夫影星。"
                                               sendDate:[NSDate date]]];
    // 赵本山
    User *zhao = [User userWithName:@"赵本山"
                      headImagePath:[[NSBundle mainBundle] pathForResource:@"headImage4" ofType:@"png"]
                      lifePhotoPath:[[NSBundle mainBundle] pathForResource:@"zhao" ofType:@"png"]];
    [_messageArray addObject:[Message messageWithSender:zhao
                                                   text:@"赵本山，1957年10月2日出生于辽宁省开原市，喜剧表演艺术家、国家一级演员，东北二人转教授，全国政协委员、中国曲艺家协会会员、全国青联委员、辽宁大学本山艺术学院院长，本山传媒集团董事长。"
                                               sendDate:[NSDate date]]];
    // 甄子丹
    User *zhen = [User userWithName:@"甄子丹"
                     headImagePath:[[NSBundle mainBundle] pathForResource:@"headImage5" ofType:@"png"]
                     lifePhotoPath:[[NSBundle mainBundle] pathForResource:@"zhen" ofType:@"png"]];
    [_messageArray addObject:[Message messageWithSender:zhen
                                                   text:@"甄子丹（Donnie Yen），1963年7月27日出生于中国广东，中国香港影视男演员、导演、武术指导"
                                               sendDate:[NSDate date]]];
    
}

#pragma mark - UITableViewDataSource and UITableViewDelegate methods

-(void)tableView:(nonnull UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        User *user = [User userWithName:@"12345" headImagePath:nil lifePhotoPath:nil];
        Message *message = [Message messageWithSender:user text:@"1234567890-hehe insert" sendDate:[NSDate date]];
        // 一定要先操作数组的元素
        [_messageArray insertObject:message atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_messageArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationRight];
    }
    // [tableView reloadData];
}

-(nullable NSString *)tableView:(nonnull UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return @"删除此行";
}

-(UITableViewCellEditingStyle)tableView:(nonnull UITableView *)tableView editingStyleForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(nonnull UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 1) {
        return YES;
    }
    return NO;
}

-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
}

-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // 防止数组越界
    if ([_messageArray count] > indexPath.row) {
        Message *message = (Message *)[_messageArray objectAtIndex:indexPath.row];
        return [CustomCell calculateCellHeightWithMessage:message];
    }
    return 0;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_messageArray count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.delegate = self;
    }
    
    [cell clearnComponents];
    
    if ([_messageArray count] > indexPath.row) {
        Message *message = (Message *)[_messageArray objectAtIndex:indexPath.row];
        [cell setComponentsWithMessage:message indexPath:indexPath];
        [cell setHeadImage:[UIImage imageWithContentsOfFile:message.sender.headImagePath]];
    }
    
    return cell;
}

#pragma mark - CustomDelegate methods

-(void)headButtonClicked:(CellButton *)headButton {
    if ([_messageArray count] > headButton.cellRow) {
        Message *message = (Message *)[_messageArray objectAtIndex:headButton.cellRow];
        UserSpaceViewController *userSpaceViewController = [[UserSpaceViewController alloc]init];
        userSpaceViewController.message = message;
        [self.navigationController pushViewController:userSpaceViewController animated:YES];
    }
}

@end
