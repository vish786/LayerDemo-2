//
//  ReflectorViewController.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ReflectorViewController.h"
#import "ReflectLayer.h"

@interface ReflectorViewController ()

@end

@implementation ReflectorViewController

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
    
    
    
    CATextLayer *messageLayer = [CATextLayer layer];
    
    [messageLayer setForegroundColor:[[UIColor blackColor] CGColor]];
    [messageLayer setContentsScale:[[UIScreen mainScreen] scale]];
    [messageLayer setFrame:CGRectMake(0, 0, 40, 40)];
    [messageLayer setString:@"A"];
    
    
    CAReplicatorLayer *replicatorX = [CAReplicatorLayer layer];
    
    //Set the replicator's attributes
    replicatorX.frame = CGRectMake(0, 0, 40, 40);
    replicatorX.anchorPoint = CGPointMake(0,0);
    replicatorX.position = CGPointMake(0, 0);
    replicatorX.instanceCount = 9;
    replicatorX.instanceDelay = 0.15;
    replicatorX.instanceAlphaOffset = -0.1;
    
    replicatorX.zPosition = 200;
    replicatorX.anchorPointZ = -160;
    
    [replicatorX addSublayer:messageLayer];
    
    [self.view.layer addSublayer:replicatorX];
    
    
    messageLayer.position = CGPointMake(40, 400);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.fillMode = kCAFillModeBackwards;
    animation.fromValue = [NSNumber numberWithInt:0];;
    animation.toValue = [NSNumber numberWithInt:400];
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    [messageLayer addAnimation:animation forKey:@"s"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
