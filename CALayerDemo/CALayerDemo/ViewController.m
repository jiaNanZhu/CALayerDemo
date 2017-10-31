//
//  ViewController.m
//  CALayerDemo
//
//  Created by 朱佳男 on 2017/10/30.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (nonatomic ,assign)CGMutablePathRef path;
@property (nonatomic ,strong)CALayer *drawLayer;
@property (nonatomic ,strong)CALayer *moveLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     1.创建一个子层，在子层上添加一个可移动的图形
     2.创建一个子层用来划线，并且记录在移动过程中的路径
     3.给有图形的子层设置动画，跟线的路径是一样的
     */
    _drawLayer = [[CALayer alloc]init];
    _drawLayer.bounds = self.view.bounds;
    _drawLayer.position = self.view.layer.position;
    _drawLayer.anchorPoint = self.view.layer.anchorPoint;
    _drawLayer.delegate = self;
    [self.view.layer addSublayer:_drawLayer];
    
    /*对动画layer进行初始化*/
    _moveLayer = [[CALayer alloc]init];
    _moveLayer.backgroundColor = [UIColor yellowColor].CGColor;
    _moveLayer.bounds = CGRectMake(0, 0, 30, 30);
    _moveLayer.position = CGPointMake(100, 100);
    [self.view.layer addSublayer:_moveLayer];
    
    // Do any additional setup after loading the view, typically from a nib.
}
/*
 
 开始画线 画线需要路径
 
 在触摸开始的时候创建路径 并设置开始点为触摸点
 
 在触摸移动的时候添加线进去并刷新
 
 在触摸结束的时候释放路径（因为path的创建是creat 需要手动释放）
 
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建一个可变的path
    _path = CGPathCreateMutable();
    //获取当前点，并将当前点设置为path的起始点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGPathMoveToPoint(_path, nil, point.x, point.y);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_path) {
        //获取当前点，并将当前点设置为path的起始点
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        CGPathAddLineToPoint(_path, nil, point.x, point.y);
        [self.drawLayer setNeedsDisplay];
    }
}
/*
 
 在触摸结束的时候开始一个动画  当然了这个动画效果就是图片层的移动
 
 首先应该创建一个动画帧 动画
 
 然后设置相应的参数
 
 最后给要设置的涂层加上动画
 
 */
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation *keyFramA = [[CAKeyframeAnimation alloc]init];
    //持续时间三秒
    keyFramA.duration = 6.0;
    //设置keypath（指定的接受动画的关键路径）
    keyFramA.keyPath = @"position";
    keyFramA.path = self.path;
    //设置图能够留在最后的位置
    keyFramA.removedOnCompletion = NO;
    keyFramA.fillMode = kCAFillModeForwards;
    //相应的添加动画
    [self.moveLayer addAnimation:keyFramA forKey:@"keyFrame"];
    if (_path) {
        CGPathRelease(_path);
    }
}
#pragma mark--实现CALayer的代理方法
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextAddPath(ctx, self.path);
    //
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextDrawPath(ctx, kCGPathStroke);//设置描边不填充
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
