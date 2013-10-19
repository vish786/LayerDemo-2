//
//  ReflectLayer.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ReflectLayer.h"
#import <QuartzCore/QuartzCore.h>
@interface MySubview : UIWebView
@end

@implementation MySubview

+ (Class) layerClass
{
    return [CAReplicatorLayer class];
}

@end
@implementation ReflectLayer
    MySubview *subview;
    CAGradientLayer *gl=nil;
    BOOL hasReflector;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}
- (void)setup
{
    hasReflector = YES;
    
    [self setBackgroundColor:[UIColor blackColor]];
    subview = [[MySubview alloc] initWithFrame:self.bounds];
    [self addSubview:subview];
    [subview setBackgroundColor:[UIColor clearColor]];
    
    // . . . do whatever with the subview to create content
    [subview setScalesPageToFit:YES];
    [subview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.flickr.com"]]];
    
    
}

- (void)layoutSubviews
{
    
    if (hasReflector){
        int gap = 4; // gap between the subview and its reflection
        
        float h1 = ceil(self.frame.size.height *.6);         // subview height
        float h2 = self.frame.size.height - (h1 + gap);        // reflection height
        
        // size the subview to make space for the reflection
        [subview setFrame:CGRectMake(0, 0, self.frame.size.width, h1)];
        
        // since the replicated layers will be sized using a scale
        // transform, we need to translate our absolute heights into
        // a scalar.
        double scale = (h2/h1);
        
        // configure the subviews replicator layer.  just two instances - the first is the
        // "real-life" rendering of the subview, the 2nd is the reflection
        CAReplicatorLayer *l = (CAReplicatorLayer *) subview.layer;
        l.instanceCount = 2;
        
        // position the instance transform.  the reflection instance will be
        // scaled by "scale" and is centered within the space of the original
        // instance, thus we compute "delta" by taking the original height,
        // subtracting out the reflection layer size, and then dividing by half.
        
        
        double delta = (h1 - h2) / 2.0 ;
        CATransform3D t = CATransform3DMakeTranslation(0, (h1+gap)-delta, 0);
        t = CATransform3DRotate(t, M_PI, 1, 0, 0);
        t = CATransform3DScale(t, 1, scale, 1);
        
        l.instanceTransform = t;
        
        if (gl == nil){
            // add a black gradient layer
            gl = [CAGradientLayer layer];
            CGColorRef c1 = [[UIColor colorWithRed:0 green:0 blue:0 alpha:.3] CGColor];
            CGColorRef c2 = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor];
            [gl setColors:[NSArray arrayWithObjects:(__bridge id)c1, (__bridge id)c2, nil]];
            
            [self.layer addSublayer:gl];
        }
        
        // position the gradient layer over the replication layer 2nd instance
        [gl setAnchorPoint:CGPointMake(0, 0)];
        [gl setFrame:CGRectMake(0, h1 + gap, self.frame.size.width, h2)];
        
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
