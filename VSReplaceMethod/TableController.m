//
//  TableController.m
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-26.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "TableController.h"
#import "CustomView.h"

@interface TableController (){
    IBOutlet CustomView *myView;
    
    IBOutlet UITableView *table;
}

@end

@implementation TableController

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
        table.delegate = nil;
        table.dataSource = nil;
#endif
        [myView removeFromSuperview];
#if __has_feature(objc_arc)
        // ARC is On
#else
        // ARC is Off
        [myView release];
#endif
        myView = nil;
    }
}

-(IBAction)sendNoti:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTI" object:nil];
}

-(void)delayAction{
    NSLog(@"delayAction");
}

-(void)dealloc{
    NSLog(@"tableview release");
    [super dealloc];
}

-(IBAction)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}
@end
