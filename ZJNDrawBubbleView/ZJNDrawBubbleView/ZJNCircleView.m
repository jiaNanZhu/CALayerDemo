//
//  ZJNCircleView.m
//  ZJNDrawBubbleView
//
//  Created by 朱佳男 on 2017/10/30.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNCircleView.h"

@implementation ZJNCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [self drawInContext:UIGraphicsGetCurrentContext()];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
   
}

-(void)drawInContext:(CGContextRef)context{
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1] CGColor]);
    [self getdrawPath:context];
    CGContextFillPath(context);
}

-(void)getdrawPath:(CGContextRef)context{
    CGRect rect = self.bounds;
    CGFloat minX = CGRectGetMinX(rect),
            midX = CGRectGetMidX(rect),
            maxX = CGRectGetMaxX(rect),
            minY = CGRectGetMinY(rect),
            maxY = CGRectGetMaxY(rect),
          radius = maxY/2.0;
    
    CGContextMoveToPoint(context, maxX, maxY);
    CGContextAddLineToPoint(context, minX, maxY);
//    CGContextAddLineToPoint(context, midX, minY);
//    CGContextAddLineToPoint(context, maxX, maxY);
    CGContextAddArc(context, midX, maxY, radius, 0, M_PI_2, 1);
    CGContextClosePath(context);
}
@end
