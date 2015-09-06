//
//  ViewController.m
//  uidemo
//
//  Created by snddfhv on 15/8/25.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>my code start
    
    NSLog(@"ViewController viewDidload");
    self.view.backgroundColor = [UIColor purpleColor];
    // self.title = @"UIViewTable";
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, width, height) style:UITableViewStylePlain];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, width, height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor blackColor];   // 分割线的颜色
    // _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 分割线的样式

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    headerView.backgroundColor = [UIColor purpleColor];
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    footerView.backgroundColor = [UIColor blueColor];
    
    _tableView.tableHeaderView = headerView;
    _tableView.tableFooterView = footerView;
    
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"信息列表"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(infoButtonClicked:)];
    self.navigationItem.rightBarButtonItem = editButton;
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>my code end
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - custome event methods
- (void)infoButtonClicked:(UIBarButtonItem *)sender {
    // SubViewController *subViewController = [[SubViewController alloc] init];
    // [self.navigationController pushViewController:subViewController animated:YES];
}

#pragma mark - UITableViewDataSource And UITableViewDelegate methods

// 返选某一行
- (void)tableView:(nonnull UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
}

// 选中某一行
- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                   message:[NSString stringWithFormat:@"section = %li, row = %li", indexPath.section, indexPath.row]
                                                  delegate:nil cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alert show];
}

/** 标题设置成View 必须设置header和footer的高哦，否则有问题 */
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}
- (nullable UIView *)tableView:(nonnull UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    headerView.backgroundColor = [UIColor redColor];
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    headerLabel.text = [NSString stringWithFormat:@"header %li", section];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont systemFontOfSize:15];
    
    [headerView addSubview:headerLabel];
    return headerView;
}
- (nullable UIView *)tableView:(nonnull UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    footerView.backgroundColor = [UIColor grayColor];
    return footerView;
}

/** 标题设置成文字
// header title
- (NSString *)tableView:(nonnull UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 不需要title返回nil
    return [NSString stringWithFormat:@"header:%li", section];
}

// footer title
- (NSString *)tableView:(nonnull UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"footer:%li", section];
} */

// 设置行高
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60;
    } else if (indexPath.section == 1) {
        return 80;
    }
    return 40;
}

// Section是分组的概念 默认为1
- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 3;
}

// Tells the data source to return the number of rows in a given section of a table view. (required)
// 告诉数据源选择区域的行数，多少行
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 可以设置不同section显示多少行
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 4;
    }
    return 2;
}

// Asks the data source for a cell to insert in a particular location of the table view. (required)
// 询问数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // 重用机制   从同一个容器中存取，根据identifier来区分容器
    // 如果不想要使用重用机制，则定义不同的identifier
    static NSString *cellIdentifier = @"cellIdentifier"; // 使用重用机制
    // NSString *cellIdentifier = [NSString stringWithFormat:@"cellIdentifier%li", indexPath.row]; // 不使用重用机制
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSLog([NSString stringWithFormat:@"创建新的cell %li", indexPath.row], nil);
        // cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Section = %li, Row = %li", indexPath.section, indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 右边部分样式
    cell.selectionStyle = UITableViewCellSelectionStyleBlue; // 选中后的样式
    return cell;
}

@end
