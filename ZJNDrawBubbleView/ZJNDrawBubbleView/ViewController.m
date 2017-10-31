//
//  ViewController.m
//  ZJNDrawBubbleView
//
//  Created by 朱佳男 on 2017/10/27.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "ZJNBubbleView.h"
#import "DemoBubbleView.h"
#import "ZJNCircleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZJNBubbleView *view = [[ZJNBubbleView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    DemoBubbleView *demoView = [[DemoBubbleView alloc]initWithFrame:CGRectMake(50, 250, 100, 100)];
    demoView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:demoView];
    
    ZJNCircleView *circleV = [[ZJNCircleView alloc]initWithFrame:CGRectMake(50, 350, 100, 100)];
    circleV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:circleV];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
