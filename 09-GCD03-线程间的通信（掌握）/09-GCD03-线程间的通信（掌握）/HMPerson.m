//
//  HMPerson.m
//  09-GCD03-线程间的通信（掌握）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMPerson.h"

@implementation HMPerson
// 只有在init开头的构造方法中，才允许对self进行赋值

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
    
    }
    return self;
}

@end
