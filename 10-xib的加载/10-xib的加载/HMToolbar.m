//
//  HMToolbar.m
//  10-xib的加载
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMToolbar.h"

@implementation HMToolbar

+ (instancetype)toolbar
{
    NSArray *objs = [[NSBundle mainBundle] loadNibNamed:@"HMToolbar" owner:nil options:nil];
    return [objs lastObject];
}

@end
