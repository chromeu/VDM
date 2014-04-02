//
//  ViewController.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClick:(id)sender
{
    
}



- (void)pan:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addView:(id)sender
{
//    NSLog(@"%s%@",__func__,[self.show observationInfo]);
//    [self.show removeObserver:self forKeyPath:nil context:nil];
//    if (!self.show ) {
//        self.show = [[VSTestView alloc] init];
//        self.show.frame = CGRectMake(58, 33, 209, 334);
//        self.show.backgroundColor = [UIColor blackColor];
//        [self.view addSubview:self.show];
//    }
}

- (IBAction)deleteView:(id)sender
{
//    [self.show addObserver:self forKeyPath:@"testtitle" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//      [self.show addObserver:self forKeyPath:@"testmessage" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    self.show.testtitle = @"1";
//    self.show.testmessage = @"1";
//    NSLog(@"%s%@",__func__,[self.show observationInfo]);
//   NSArray *array = [(NSArray *) [self.show observationInfo] valueForKey:@"observances"];
//    NSLog(@"array:::%@",array);
//    for (id observeance in array) {
//        NSLog(@"key:%@",observeance);
//        NSLog(@"key:%@",[[observeance valueForKey:@"property"] valueForKey:@"keyPath"]);
//    }
//    [_show removeFromSuperview];
//    self.show = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    NSLog(@"keyPath"); 
}

@end
