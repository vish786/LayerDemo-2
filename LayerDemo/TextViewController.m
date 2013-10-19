//
//  TextViewController.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TextViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TextViewController ()

@end

@implementation TextViewController

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
    [[UINavigationBar appearance] setBarStyle: UIBarStyleBlack];
    [super viewDidLoad];
    
    NSString *strText = @"Testing layer";
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    float width = 100;
    CGSize size = [strText sizeWithFont:font constrainedToSize:CGSizeMake(width, 999)];
    
    CATextLayer *TextLayer = [CATextLayer layer];
    TextLayer.bounds = CGRectMake(0.0f, 0.0f, size.width, size.height);
    TextLayer.string = strText;
    TextLayer.font = (__bridge CFTypeRef)(font.fontName);
    TextLayer.backgroundColor = [UIColor blackColor].CGColor;
    TextLayer.position = CGPointMake(80.0, 80.0f);
    TextLayer.wrapped = NO;
    [self.view.layer addSublayer:TextLayer];
    // Do any additional setup after loading the view from its nib.
    
//    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
//    rotationAndPerspectiveTransform.m34 = 1.0 / -200;
//    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
//    self.view.layer.transform = rotationAndPerspectiveTransform;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
