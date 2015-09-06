//
//  AppDelegate.m
//  lesson02
//
//  Created by snddfhv on 15/7/31.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 类似于注释，又不同于注释，代码分模块
#pragma mark - Custom methods

- (void) loadMainFrame{
    // oneViewController
    OneViewController *oneViewController = [[OneViewController alloc] init];
    UINavigationController  *oneNavigationController
        = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    oneNavigationController.tabBarItem.title = @"One";
    oneNavigationController.tabBarItem.image = [UIImage imageNamed: @"one.png"];
    // oneNavigationController.navigationBar.translucent = NO; // 设置成透明，默认为YES，这样的话原点就改变了
    
    // twoViewController
    TwoViewController *twoViewController = [[TwoViewController alloc] init];
    UINavigationController  *twoNavigationController
    = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    twoNavigationController.tabBarItem.title = @"Two";
    twoNavigationController.tabBarItem.image = [UIImage imageNamed: @"two.png"];
    
    // threeViewController
    ThreeViewController *threeViewController = [[ThreeViewController alloc] init];
    UINavigationController  *threeNavigationController
    = [[UINavigationController alloc] initWithRootViewController:threeViewController];
    threeNavigationController.tabBarItem.title = @"Three";
    threeNavigationController.tabBarItem.image = [UIImage imageNamed: @"three.png"];
    
    // fourViewController
    FourViewController *fourViewController = [[FourViewController alloc] init];
    UINavigationController  *fourNavigationController
    = [[UINavigationController alloc] initWithRootViewController:fourViewController];
    fourNavigationController.tabBarItem.title = @"Four";
    fourNavigationController.tabBarItem.image = [UIImage imageNamed: @"four.png"];
    
    // fiveViewController
    FiveViewController *fiveViewController = [[FiveViewController alloc] init];
    UINavigationController  *fiveNavigationController
    = [[UINavigationController alloc] initWithRootViewController:fiveViewController];
    fiveNavigationController.tabBarItem.title = @"Five";
    fiveNavigationController.tabBarItem.image = [UIImage imageNamed: @"five.png"];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // NSArray *viewControllers = [NSArray arrayWithObjects:oneNavigationController, nil];
    // 不可变的字典的字面量 字典数组里面存放NSNumber对象 @基本类型->转成对象
    // NSDictionary *dic = @{@"name":@"zhangsan", @"age":@30};
    // @字面量，快速构建不可变数组
    [tabBarController setViewControllers:@[oneNavigationController,
                                           twoNavigationController,
                                           threeNavigationController,
                                           fourNavigationController,
                                           fiveNavigationController]];
    
    self.window.rootViewController = tabBarController;
}

#pragma mark - Application lifecycle methods


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    // >>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 访问图片资源：原始的方式
    // UIImage *image = [UIImage imageNamed:@"bg1.png"];
    
    [self loadMainFrame];
    
    /*
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"name %@", device.name);
    NSLog(@"systemName %@", device.systemName);
    NSLog(@"systemVersion %@", device.systemVersion);
    NSLog(@"model %@", device.model);
    UIScreen *screen = [UIScreen mainScreen];
    */
    // 获取代理。。。
    // AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    [self.window makeKeyAndVisible];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>> my code end
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"lesson02" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"lesson02.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
