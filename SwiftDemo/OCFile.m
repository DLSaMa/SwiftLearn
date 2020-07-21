//
//  OCFile.m
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/21.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

#import "OCFile.h"

@implementation OCFile
//方法声明实现
- (void)run{
    NSLog(@"%s",__func__);
}
+ (void)play{
    NSLog(@"%s",__func__);
}

//外部函数
extern void sayHi(){
    printf("sayHi\n");
}
//内部函数
static void sayHello(){
    printf("sayHello");
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    Person *p = [[Person alloc]init];
//    //方法调用
//    [p run];
//    [Person play];
    //函数调用
    sayHi();
    sayHello();
}
@end
