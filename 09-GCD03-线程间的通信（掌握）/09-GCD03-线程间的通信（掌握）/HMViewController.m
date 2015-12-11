//
//  HMViewController.m
//  09-GCD03-线程间的通信（掌握）
//
//  Created by apple on 14-9-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

// 需要设置按钮的image和backgroundImage，建议先把按钮类型改为custom，才能保证设置成功
// 属性名不能以new开头
// 只有在init开头的构造方法中，才允许对self进行赋值

#define HMGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define HMMainQueue dispatch_get_main_queue()

#import "HMViewController.h"

@interface HMViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self imageView];
    
    
//    NSObject *obj = [NSObject new];
//    
//    [[NSObject alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    dispatch_async(HMGlobalQueue, ^{
        NSLog(@"donwload---%@", [NSThread currentThread]);
        // 1.子线程下载图片
        NSURL *url = [NSURL URLWithString:@"http://d.hiphotos.baidu.com/image/pic/item/37d3d539b6003af3290eaf5d362ac65c1038b652.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        // 2.回到主线程设置图片
        dispatch_async(HMMainQueue, ^{
            NSLog(@"setting---%@ %@", [NSThread currentThread], image);
            [self.button setImage:image forState:UIControlStateNormal];
        });
    });
}

@end
