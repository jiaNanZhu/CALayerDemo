//
//  ZJNBubbleView.m
//  ZJNDrawBubbleView
//
//  Created by 朱佳男 on 2017/10/27.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNBubbleView.h"

@implementation ZJNBubbleView


 //Only override drawRect: if you perform custom drawing.
 //An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [self drawInContext:UIGraphicsGetCurrentContext()];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
}

-(void)drawInContext:(CGContextRef)context{
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1] CGColor]);
    
    [self getDrawPath:context];
    CGContextFillPath(context);
}

-(void)getDrawPath:(CGContextRef)context{
    CGRect rect = self.bounds;
    
    CGFloat radius = 10,
            arrowHeight = 10,
            minX = CGRectGetMinX(rect)+arrowHeight,
            maxX = CGRectGetMaxX(rect)-arrowHeight,
            midX = CGRectGetMidX(rect),
            minY = CGRectGetMinY(rect)+arrowHeight,
            midY = CGRectGetMidY(rect),
            maxY = CGRectGetMaxY(rect)-arrowHeight;
    CGContextMoveToPoint(context, midX+arrowHeight, maxY);
    CGContextAddLineToPoint(context, midX, maxY+arrowHeight);
    CGContextAddLineToPoint(context, midX-arrowHeight, maxY);
    CGContextAddArcToPoint(context, minX, maxY, minX, midY+arrowHeight, radius);
    CGContextAddLineToPoint(context, minX, midY+arrowHeight);
    CGContextAddLineToPoint(context, minX-arrowHeight, midY);
    CGContextAddLineToPoint(context, minX, midY-arrowHeight);
    CGContextAddArcToPoint(context, minX, midY-arrowHeight, minX, minY, radius);
    CGContextAddArcToPoint(context, minX, minY, maxX, minY, radius);
    CGContextAddArcToPoint(context, maxX, minY, maxX, maxY, radius);
    CGContextAddArcToPoint(context, maxX, maxY, midX-arrowHeight, maxY, radius);
    CGContextClosePath(context);
}
@end
