//
//  TennisBall.m
//  LayerDemo
//
//  Created by indianic on 10/10/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TennisBall.h"

@implementation TennisBall

+ (Class)layerClass
{
    return [CAShapeLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
    }
    return self;
}

/* Create the tennis ball */
- (void)setupLayer
{
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.strokeColor = [[UIColor blackColor] CGColor];
    layer.fillColor = [[UIColor purpleColor] CGColor];
    layer.lineWidth = 5.0;
    
    layer.path = [self defaultPath];
}

/* Animate the tennis ball "bouncing" off of the side of the screen */
- (void)bounce
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 2.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = (__bridge id)[self defaultPath];
    animation.toValue = (__bridge id)[self compressedPath];
    animation.autoreverses = YES;
    [self.layer addAnimation:animation forKey:@"animatePath"];
}

/* A path representing the tennis ball in the default state */
- (CGPathRef)defaultPath
{
    return [[UIBezierPath bezierPathWithOvalInRect:self.frame] CGPath];
}

/* A path representing the tennis ball is the compressed state (during the bounce) */
- (CGPathRef)compressedPath
{
    CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width * 0.5, self.frame.size.height*0.5);
    return [[UIBezierPath bezierPathWithOvalInRect:newFrame] CGPath];
}


@end
