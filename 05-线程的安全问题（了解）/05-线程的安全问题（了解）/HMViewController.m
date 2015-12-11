//
//  HMViewController.m
//  05-线程的安全问题（了解）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;

/**
 *  剩余票数
 */
@property (nonatomic, assign) int leftTicketCount;

//@property (nonatomic, strong) NSObject *locker;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.leftTicketCount = 50;
    
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread1.name = @"1号窗口";
    
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread2.name = @"2号窗口";
    
    self.thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread3.name = @"3号窗口";
    
//    self.locker = [[NSObject alloc] init];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.thread1 start];
    [self.thread2 start];
    [self.thread3 start];
}

/**
 *  卖票
 */
- (void)saleTicket
{
    while (1) {
        // ()小括号里面放的是锁对象
        @synchronized(self) { // 开始加锁
            int count = self.leftTicketCount;
            if (count > 0) {
                [NSThread sleepForTimeInterval:0.05];
                
                self.leftTicketCount = count - 1;
                
                NSLog(@"%@卖了一张票, 剩余%d张票", [NSThread currentThread].name, self.leftTicketCount);
            } else {
                return; // 退出循环
            }
        } // 解锁
    }
}

@end
