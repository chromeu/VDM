//
//  ScrolViewController.m
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-26.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "ScrolViewController.h"
#import "CustomView.h"

@interface ScrolViewController (){
    IBOutlet CustomView *myView;

    IBOutlet    UIScrollView *scrollView;
    
    IBOutlet    UIButton    *btn;
    UITapGestureRecognizer *tap;
}

@end

@implementation ScrolViewController

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
    [scrollView setContentSize:CGSizeMake(320, 2000)];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:myView action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    [btn addTarget:myView action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)removeView:(id)sender{
    if (myView) {
        NSLog(@"customview remove");
#ifdef USER_DEPENDENCY_SELF
        scrollView.delegate = nil;
        [btn removeTarget:myView action:NULL forControlEvents:UIControlEventAllEvents];
        [tap removeTarget:myView action:NULL];
#endif
        [myView removeFromSuperview];
#if __has_feature(objc_arc)
        // ARC is On
#else
        // ARC is Off
//        [myView performSelector:@selector(delayAction) withObject:nil afterDelay:10];
        [myView release];
        [myView release];
#endif
        myView = nil;

    }
}

-(void)dealloc{
    NSLog(@"scrolviewcontroller release");
    [super dealloc];
}

-(IBAction)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
