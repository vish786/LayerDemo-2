//
//  Drawing.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "Drawing.h"

@implementation Drawing

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextStrokePath(context);
    
    //Draw Elipse
    /* CGContextRef context = UIGraphicsGetCurrentContext();
     
     CGContextSetLineWidth(context, 2.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGRect rectangle = CGRectMake(60,170,200,80);
     
     CGContextAddEllipseInRect(context, rectangle);
     
     CGContextStrokePath(context);
     */
    //Fill shape
    /*CGContextRef context = UIGraphicsGetCurrentContext();
     */
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);
    
    //Draw Rectangle
    /*CGContextRef context = UIGraphicsGetCurrentContext();
     
     CGContextSetLineWidth(context, 2.0);
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGRect rectangle = CGRectMake(60,170,200,80);
     CGContextAddRect(context, rectangle);
     CGContextStrokePath(context);
     CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
     CGContextFillRect(context, rectangle);
     */
}

@end
