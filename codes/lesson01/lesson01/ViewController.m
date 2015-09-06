//
//  ViewController.m
//  lesson01
//
//  Created by snddfhv on 15/7/22.
//  Copyright (c) 2015年 snddfhv. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>my code start
    /*
    Person * zhangsan = [[Person alloc] initWithName:@"小张" age:19];
    // Person * zhangsan_weak = [zhangsan weak];
    Person * zhangsan_assign = [zhangsan assign];
    NSLog(@"zhangsan %@", zhangsan);
    // NSLog(@"zhangsan_weak %@", zhangsan_weak);
    NSLog(@"zhangsan_assign %@", zhangsan_assign);
    */
    
    NSString * name = @"xiaosan";
    
    NSString * name_weak = [name copy];
    NSString * name_assign = [name copy];
    
    // NSLog(@"%lu", (unsigned long)[name retainCount]);
    
    NSLog(@"name %@", name);
    NSLog(@"name_weak %@", name_weak);
    NSLog(@"name_assign %@", name_assign);
    
    Person *lisi = [[Person alloc]initWithName:@"lisi" age:18];
    
    /** 数组测试 */
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>字典测试");
    NSArray *myArray;
    NSDate *aDate = [NSDate distantFuture];
    NSValue *aValue = [NSNumber numberWithInt:5];
    NSString *aString = @"a string";
    myArray = [NSArray arrayWithObjects:aDate, aValue, aString, nil]; // 这里有个坑，如果nil前面有一个元素本身就为nil，那么这个数组就不对啦！！！
    NSLog(@"array count %lu", (unsigned long)[myArray count]);
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    [mutableArray addObject:aDate];
    [mutableArray addObject:aValue];
    [mutableArray addObject:aString];
    [mutableArray removeObjectAtIndex:0];
    [mutableArray replaceObjectAtIndex:0 withObject:aValue];
    [mutableArray replaceObjectAtIndex:1 withObject:lisi];
    id obj = [mutableArray objectAtIndex:1];
    // 类型检查
    if ([[obj class]isSubclassOfClass:[NSNumber class]]) { // NSNumber类型
        NSInteger intValue = [(NSNumber *)obj integerValue];
        NSLog(@"NSNumber %li", (long)intValue);
    } else if ([[obj class] isSubclassOfClass:[Person class]]) {
        [(Person *)obj sayMyInfo];
    }
    
    /** 字典测试 */
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>字典测试");
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:lisi, @"lisi", aValue, @"aValue", nil];
    NSArray *allKeys = [dictionary allKeys];
    for (int i=0; i<[allKeys count]; i++) {
        NSString *key = allKeys[i];
        obj = [dictionary valueForKey:key];
        if ([[obj class]isSubclassOfClass:[NSNumber class]]) { // NSNumber类型
            NSInteger intValue = [(NSNumber *)obj integerValue];
            NSLog(@"NSNumber %li", (long)intValue);
        } else if ([[obj class] isSubclassOfClass:[Person class]]) {
            [(Person *)obj sayMyInfo];
        }
    }
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc]init];
    [mutableDictionary setValue:lisi forKey:@"lisi"];
    [mutableDictionary  setValue:aValue forKey:@"aValue"];
    [mutableDictionary removeObjectForKey:@"aValue"];
    
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>my code end
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
