//
//  ShapeViewController.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ShapeViewController.h"
#import "TennisBall.h"

@interface ShapeViewController ()

@end

@implementation ShapeViewController

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
    float width = 150;
    float height = 150;
    CGRect rect = CGRectMake(50,60, width, height);
    NSLog(@"%@",NSStringFromCGRect(rect));
    TennisBall *ball = [[TennisBall alloc] initWithFrame:rect];
    [self.view addSubview:ball];
    
    [ball bounce];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
