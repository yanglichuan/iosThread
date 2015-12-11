//
//  HMViewController.m
//  11-xib的加载2
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMHomeViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    HMHomeViewController *homeVc = [[HMHomeViewController alloc] init];
    homeVc.view.backgroundColor = [UIColor redColor];
    homeVc.title = @"首页界面";
    [self.navigationController pushViewController:homeVc animated:YES];
    
    // 控制器默认会自动找对应的xib来创建view
    // 1.去掉Controller这个单词后的同名的xib：HMHomeView.xib
    // 2.完全同名的xib：HMHomeViewController.xib
}

@end
