//
//  ViewController.m
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ViewController.h"
#import "ShapeViewController.h"
#import "TransformViewController.h"
#import "ReflectorViewController.h"
#import "TextViewController.h"
#import "TransformationVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Layer Demo";
    
    NSDateComponents *newDate = [NSDateComponents new];
    newDate.day = [@"30" intValue];
    
    NSDate *firstDate = [[NSCalendar currentCalendar] dateFromComponents:newDate];
    
    NSLog(@"%li", (long)newDate.day);
    NSLog(@"%@", firstDate);
	// Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)btnTap:(UIButton *)sender
{
    UIButton *btnTap = (UIButton *)sender;
    if (btnTap.tag==1)
    {
        ShapeViewController *shapeVC=[[ShapeViewController alloc]init];
        [self.navigationController pushViewController:shapeVC animated:YES];
    
    }
    else if (btnTap.tag==2)
    {
        TransformViewController *transformVC=[[TransformViewController alloc]init];
        [self.navigationController pushViewController:transformVC animated:YES];
    }
    else if (btnTap.tag==3)
    {
        ReflectorViewController *reflectorVC=[[ReflectorViewController alloc]init];
        [self.navigationController pushViewController:reflectorVC animated:YES];
    }
    else if (btnTap.tag==4)
    {
        TextViewController *textVC=[[TextViewController alloc]init];
        [self.navigationController pushViewController:textVC animated:YES];
    }
    else if (btnTap.tag==5)
    {
        TransformationVC *transVC=[[TransformationVC alloc]init];
        [self.navigationController pushViewController:transVC animated:YES];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
