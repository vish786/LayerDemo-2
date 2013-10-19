//
//  TransformViewController.h
//  LayerDemo
//
//  Created by IndiaNIC on 04/07/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransformViewController : UIViewController
{
    UIView *boxView;
    float   scaleFactor;
    float   angle;
}
@property (nonatomic, retain) UIView *boxView;

@end
