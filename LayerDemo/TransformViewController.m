//
//  TransformViewController.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TransformViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TransformViewController ()

@end

@implementation TransformViewController
@synthesize boxView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
	[super loadView];
    
    scaleFactor = 2;
    angle = 180;
    CGRect frameRect = CGRectMake(10, 10, 45, 45);
    self.view.backgroundColor=[UIColor clearColor];
    
    boxView = [[UIView alloc] initWithFrame:frameRect];
    boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:boxView];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    boxView.center = location;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGAffineTransform scaleTrans =
    CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    CGAffineTransform rotateTrans =
    CGAffineTransformMakeRotation(angle * M_PI / 180);
    boxView.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);
    angle = (angle == 180 ? 360 : 180);
    scaleFactor = (scaleFactor == 2 ? 1 : 2);
    boxView.center = location;
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
