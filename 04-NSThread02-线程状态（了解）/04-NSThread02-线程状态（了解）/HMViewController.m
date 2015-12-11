//
//  HMViewController.m
//  04-NSThread02-线程状态（了解）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()
@property (nonatomic, strong) NSThread *thread;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(download) object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)download
{
    NSLog(@"-----begin");
    
    // 睡眠5秒钟
//    [NSThread sleepForTimeInterval:5];
    
    // 3秒后的时间
//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:3];
//    [NSThread sleepUntilDate:date];
   
    
    for (int i = 0; i<100; i++) {
        NSLog(@"------%d", i);
//        return;
        
//        if (i == 49) {
//            [NSThread exit];
//        }
    }
    
    
    NSLog(@"-----end");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self.thread start];
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(download) object:nil];
    [thread start];
}

@end
