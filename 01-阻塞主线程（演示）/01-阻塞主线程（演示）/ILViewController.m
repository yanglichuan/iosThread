//
//  ILViewController.m
//  01-阻塞主线程（演示）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ILViewController.h"

@interface ILViewController ()

@end

@implementation ILViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (int i = 0; i<10000; i++) {
        NSLog(@"---------%d", i);
    }
}

@end
