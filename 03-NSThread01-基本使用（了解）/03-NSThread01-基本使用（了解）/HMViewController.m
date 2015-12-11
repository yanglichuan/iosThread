//
//  HMViewController.m
//  03-NSThread01-基本使用（了解）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)download:(NSString *)url
{
    NSLog(@"下载东西---%@---%@", url, [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createThread3];
}

/**
 * 创建线程的方式3
 */
- (void)createThread3
{
    // 这2个不会创建线程，在当前线程中执行
//    [self performSelector:@selector(download:) withObject:@"http://c.gif"];
//    [self download:@"http://c.gif"];
    
    [self performSelectorInBackground:@selector(download:) withObject:@"http://c.gif"];
}

/**
 * 创建线程的方式2
 */
- (void)createThread2
{
    [NSThread detachNewThreadSelector:@selector(download:) toTarget:self withObject:@"http://a.jpg"];
}

/**
 * 创建线程的方式1
 */
- (void)createThread1
{
    // 创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(download:) object:@"http://b.png"];
    thread.name = @"下载线程";
    
    // 启动线程（调用self的download方法）
    [thread start];
}

@end
