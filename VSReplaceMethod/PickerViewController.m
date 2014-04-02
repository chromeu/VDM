//
//  PickerViewController.m
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-26.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "PickerViewController.h"
#import "CustomView.h"

@interface PickerViewController (){
    IBOutlet CustomView *myView;
    
    IBOutlet UIPickerView *picker;
    
    NSMutableDictionary *num;
}

@end

@implementation PickerViewController

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
    num = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"1",@"value",nil];
    [num addObserver:myView forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    [num addObserver:myView forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    [num addObserver:myView forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];

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
        picker.delegate = nil;
        picker.dataSource = nil;
        [num removeObserver:myView forKeyPath:@"value"];
        //

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

-(IBAction)changeNum:(id)sender{
    if ([[num objectForKey:@"value"] isEqualToString:@"0"]) {
        [num setValue:@"1" forKey:@"value"];
    }else{
        [num setValue:@"0" forKey:@"value"];
    }
}

-(void)dealloc{
    NSLog(@"picker release");
    [super dealloc];
}

-(IBAction)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
