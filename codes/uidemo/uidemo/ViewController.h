//
//  ViewController.h
//  uidemo
//
//  Created by snddfhv on 15/8/25.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <UIKit/UIKit.h>

// UITableViewDataSource,UITableViewDelegate两个都是代理，只是名字不同
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    
    UITableView *_tableView;
}


@end

