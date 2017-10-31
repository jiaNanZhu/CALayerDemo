//
//  DemoBubbleView.m
//  ZJNDrawBubbleView
//
//  Created by 朱佳男 on 2017/10/27.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "DemoBubbleView.h"

@implementation DemoBubbleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawInContext:UIGraphicsGetCurrentContext()];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    self.layer.shadowOpacity = 1.0;
    
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    
}
-(void)drawInContext:(CGContextRef)context

{
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0].CGColor);
    
    [self getDrawPath:context];
    
    CGContextFillPath(context);
    
}

- (void)getDrawPath:(CGContextRef)context

{
    
    CGRect rrect = self.bounds;
    
    CGFloat radius = 6.0;
    
    CGFloat minx = CGRectGetMinX(rrect),
    
    midx = CGRectGetMidX(rrect),
    
    maxx = CGRectGetMaxX(rrect),
    
    Arror_height = 10;
    CGFloat miny = CGRectGetMinY(rrect),
    
    // midy = CGRectGetMidY(rrect),
    
    maxy = CGRectGetMaxY(rrect)-Arror_height;
    
    CGContextMoveToPoint(context, midx+Arror_height, maxy);
    
    CGContextAddLineToPoint(context,midx, maxy+Arror_height);
    
    CGContextAddLineToPoint(context,midx-Arror_height, maxy);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    
    CGContextClosePath(context);
    
}



@end
