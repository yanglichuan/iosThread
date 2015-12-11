//
//  HMViewController.m
//  10-xib的加载
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMToolbar.h"

// -[UITapGestureRecognizer superview]: unrecognized selector sent to instance 0x8e407a0

// 分析：
// 方法属于谁：UIView

// 结论：
// 错误将UITapGestureRecognizer当做UIView来使用

@interface HMViewController ()
- (IBAction)tapGreenView:(UITapGestureRecognizer *)sender;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    HMToolbar *tool = [HMToolbar toolbar];
    [self.view addSubview:tool];
}

- (IBAction)tapGreenView:(UITapGestureRecognizer *)sender {
    NSLog(@"tapGreenView----点击了绿色");
}
@end
