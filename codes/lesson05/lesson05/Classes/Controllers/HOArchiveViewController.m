//
//  HOArchiveViewController.m
//  lesson05
//
//  Created by snddfhv on 15/9/8.
//  Copyright © 2015年 h2o1k. All rights reserved.
//

#import "HOArchiveViewController.h"

#define UserDataName @"userData.dat"

@interface HOArchiveViewController ()

@end

@implementation HOArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>> my code start
    
    [self initVariables];
    [self initComponents];
    
    // >>>>>>>>>>>>>>>>>>>>> my code end
    
}

#pragma mark - custom methods

-(void)initVariables {
    
}

-(void)initComponents {
    self.navigationController.title = @"归档数据";
    
    UIBarButtonItem *readButton = [[UIBarButtonItem alloc] initWithTitle:@"读取"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(readButtonClicked:)];
    self.navigationItem.leftBarButtonItem = readButton;
    UIBarButtonItem *writeButton = [[UIBarButtonItem alloc] initWithTitle:@"写入"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(writeButtonClicked:)];
    self.navigationItem.rightBarButtonItem = writeButton;
    
    CGFloat width = self.view.bounds.size.width - 40;
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 74, width, 31)];
    _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTextField.textAlignment = NSTextAlignmentCenter;
    _userNameTextField.font = [UIFont systemFontOfSize:15.0f];
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.returnKeyType = UIReturnKeyDone;
    _userNameTextField.delegate = self;
    [self.view addSubview:_userNameTextField];
    
    _emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 115, width, 31)];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.textAlignment = NSTextAlignmentCenter;
    _emailTextField.font = [UIFont systemFontOfSize:15.0f];
    _emailTextField.placeholder = @"请输入email";
    _emailTextField.returnKeyType = UIReturnKeyDone;
    _emailTextField.delegate = self;
    [self.view addSubview:_emailTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 156, width, 31)];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.textAlignment = NSTextAlignmentCenter;
    _passwordTextField.font = [UIFont systemFontOfSize:15.0f];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.returnKeyType = UIReturnKeyDone;
    _passwordTextField.delegate = self;
    [self.view addSubview:_passwordTextField];
    
    _ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 197, width, 31)];
    _ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    _ageTextField.textAlignment = NSTextAlignmentCenter;
    _ageTextField.font = [UIFont systemFontOfSize:15.0f];
    _ageTextField.placeholder = @"请输入年龄";
    _ageTextField.returnKeyType = UIReturnKeyDone;
    _ageTextField.delegate = self;
    [self.view addSubview:_ageTextField];
    
    UIButton *writeFileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    writeFileButton.frame = CGRectMake(10, 197+31+10, 100, 31);
    [writeFileButton setTitle:@"简单数据写入" forState:UIControlStateNormal];
    [writeFileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [writeFileButton addTarget:self action:@selector(writeFileButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [writeFileButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:writeFileButton];
    
    
}

#pragma mark - button clicked methods

-(void)writeFileButtonClicked:(id)sender {
    /** 字符串的操作 */
    NSString *string = @"这是一个字符串";
    NSString *stringFilePath = [Utility getPathWithDocumentDir:@"aa/bb/cc/string.text"];
    NSError *error = nil;
    
    // 创建目录
    [Utility createDirectory:stringFilePath lastComponentIsDirectory:NO];

    // 将字符串写入到文件
    [string writeToFile:stringFilePath  // 路径
             atomically:YES // 存在就不写入
               encoding:NSUTF8StringEncoding // 编码
                  error:&error]; // 错误信息
    
    // 将文件里的内容读取为字符串
    NSString *cachedString = [NSString stringWithContentsOfFile:stringFilePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"HOArchiveViewController.writeFileButton cachedString:%@", cachedString);
    
    // 删除文件
    [Utility removeFile:stringFilePath];
    
    /** dictionary的操作 */
    NSDictionary *dictionary = @{@"age":@30, @"name":@"zhangsan"};
    NSString *dicPath = [Utility getPathWithDocumentDir:@"dic.plist"];
    [dictionary writeToFile:dicPath atomically:YES];
    NSDictionary *cachedDictionary = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    NSLog(@"HOArchiveViewController.writeFileButton cachedDictionary:%@", cachedDictionary);
    
    /** Array的操作 */
    NSArray *array = [NSArray arrayWithObjects:@"abc", @80, dictionary, nil];
    NSString *arrayPath = [Utility getPathWithDocumentDir:@"array.plist"];
    [array writeToFile:arrayPath atomically:YES];
    NSArray *cachedArray = [NSArray arrayWithContentsOfFile:arrayPath];
    NSLog(@"HOArchiveViewController.writeFileButton cachedArray:%@", cachedArray);
}

-(void)readButtonClicked:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger test = [userDefaults integerForKey:@"integer"];
    NSLog(@"HOArchiveViewController.readButtonClicked test = %li", test);
    
    NSString *userDataPath = [Utility getPathWithDocumentDir:UserDataName];
    NSLog(@"HOArchiveViewController.readButtonClicked userDataPath %@", userDataPath);
    if ([userDataPath length] > 0 && [[NSFileManager defaultManager] fileExistsAtPath:userDataPath]) {
        NSData *userData = [NSData dataWithContentsOfFile:userDataPath];
        HOUser *user = (HOUser *)[Utility unarchiverObject:userData withKey:@"UserData"];
        
        _userNameTextField.text = user.userName;
        _emailTextField.text = user.email;
        _passwordTextField.text = user.password;
        _ageTextField.text = [NSString stringWithFormat:@"%ld", user.age];
    }
}

-(void)writeButtonClicked:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:66 forKey:@"integer"];
    
    HOUser *user = [[HOUser alloc] init];
    user.userName = _userNameTextField.text;
    user.email = _emailTextField.text;
    user.password = _passwordTextField.text;
    user.age = [_ageTextField.text integerValue]; // 这个不需要类型判断吗？？？
    
    NSData *userData = [Utility archiverObject:user forKey:@"UserData"];
    NSString *userDataPath = [Utility getPathWithDocumentDir:UserDataName];
    NSLog(@"HOArchiveViewController.writeButtonClicked userDataPath %@", userDataPath);
    [userData writeToFile:userDataPath atomically:YES];
}

#pragma mark - UITextFieldDelegate methods
-(BOOL)textFieldShouldReturn:(nonnull UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
