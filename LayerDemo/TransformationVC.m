//
//  TransformationVCViewController.m
//  LayerDemo
//
//  Created by indianic on 10/11/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TransformationVC.h"

@interface TransformationVC ()

@end

@implementation TransformationVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self showLayerTransform];
    //[self showUIViewAnimation];
    //[self showCATransition];`
    //[self showCABasicAnimation];
    [self showCAKeyframeAnimation];
}

-(void)showLayerTransform
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(50, 50, 100, 100);
    container.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:container];
    
    //Apply transformation to the PLANE
    CATransform3D t = CATransform3DIdentity;
    //Angle yourAngle* M_PI / 180.0f
    
    //Perform a translation
    t = CATransform3DTranslate(t, 50, 50, 0);
    
    //    //Perform a Scale
    //    t = CATransform3DScale(t, 2.0, 2.0,2.0);
    //
    //    //Perform a rotation and then a translation
    //    //Here always z is 1 for performing normal transform
    //    t = CATransform3DRotate(t, M_PI_4, 0, 0, 1);
    //
    //    //Add the perspective!!!
    //    t.m34 = 1.0/ -500;
    //    //Here change x and y as 1 for performing transform in x and y plane and set z as 0
    //    t = CATransform3DRotate(t, M_PI_4, 0, 1, 0);
    
    container.transform = t;
}

-(void)showUIViewAnimation
{
    UIView *newView = [[UIView alloc]init];
    newView.tag = 999;
    newView.backgroundColor = [UIColor brownColor];
    newView.frame = CGRectMake(50, self.view.frame.size.height, 100, 100);
    [self.view addSubview:newView];

    //blocks
//    [UIView animateWithDuration:1.0 animations:^{
//        [newView setFrame:CGRectMake(50, 50, 100, 100)];
//    } completion:^(BOOL finished) {
//        newView.backgroundColor = [UIColor redColor];
//    }];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationStop)];
    [newView setFrame:CGRectMake(50, 50, 100, 100)];
    [UIView commitAnimations];
}

-(void)animationStop
{
    UIView *newView = [self.view viewWithTag:999];
    if (newView) {
        newView.backgroundColor = [UIColor redColor]; 
    }
    
}


-(void)showCATransition
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(50, 50, 100, 100);
    container.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:container];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    
    [container addAnimation:transition forKey:kCATransition];
}

-(void)showCABasicAnimation
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(50, 50, 100, 100);
    container.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:container];
    
    // Create an animation that will change the position of a layer
    CABasicAnimation *mover = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // It will last 1 second
    [mover setDuration:1.0];
    
    // Setting starting position
    [mover setFromValue:[NSValue valueWithCGPoint:CGPointMake(container.frame.origin.x, container.frame.origin.y)]];
    
    // Setting ending position
    [mover setToValue:[NSValue valueWithCGPoint:CGPointMake(container.frame.origin.x, container.frame.origin.y+150)]];
    
    // Add it to the layer
    [container addAnimation:mover forKey:@"BigMove"];
    
    // Maintain the end position at 400.0 450.0 OTHERWISE IT IS GOING BACK TO ORIGINAL POSITION
    [container setPosition:CGPointMake(container.frame.origin.x, container.frame.origin.y+150)];
}

-(void)showCAKeyframeAnimation
{
    CALayer *container = [CALayer layer];
    container.frame = CGRectMake(50, 50, 100, 100);
    container.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:container];
    
    CAKeyframeAnimation *showAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    showAnimation1.values = @[@0,@M_PI_4,@M_PI_2,@M_PI];
    showAnimation1.duration = 1.0;
    showAnimation1.delegate = self;
    
    [container addAnimation:showAnimation1 forKey:@"show"];
    
//    CAKeyframeAnimation *showAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.y"];
//    showAnimation2.values = @[@0,@M_PI_4,@M_PI_2,@M_PI];
//    showAnimation2.duration = 1.0;
//    showAnimation2.delegate = self;
    
    // group
//    CAAnimationGroup* group = [CAAnimationGroup animation];
//    group.animations = @[showAnimation1, showAnimation2];
//    group.duration = showAnimation1.duration + showAnimation1.duration;
//    
//    [container addAnimation:group forKey:@"groupAnm"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
