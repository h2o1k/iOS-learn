//
//  FourViewController.m
//  lesson02
//
//  Created by snddfhv on 15/8/1.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "FourViewController.h"
#import "DragonViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.title = @"Four";
    NSLog(@"%@ viewDidLoad", self.title);
    self.bgImageView.image = [UIImage imageNamed:@"bg4"];
    
    UIButton *protocolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    protocolButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [protocolButton setTitle:@"push a view" forState:UIControlStateNormal];
    UIImage *blueBGImage = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [protocolButton setBackgroundImage:stretchableBlueBGImage forState:UIControlStateNormal];
    [protocolButton addTarget:self
                   action:@selector(protocolButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:protocolButton];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

#pragma mark - Custom event methods

- (void)protocolButtonClicked:(id)sender {
    DragonViewController *dragonViewController = [[DragonViewController alloc] init];
    // [self presentModalViewController:(UIViewController *) animated:YES];
    [self presentViewController:dragonViewController animated:YES completion:nil];
}


#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
