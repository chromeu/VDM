//
//  CustomView.m
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-26.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNoti:) name:@"NOTI" object:nil];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNoti:) name:@"NOTI" object:nil];
//        timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(repeatAction) userInfo:nil repeats:YES];
    }
    return self;
}
#pragma mark - UITableViewDelgate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click cell");
}

#pragma mark - UIPickerViewDataSource & UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 20;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%d_%d",component,row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"click pick");
}


#pragma mark - UISCrollerViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrol drag");
}


#pragma mark - UIGestureRecognizer Action

-(void)tap:(UIGestureRecognizer*)tap{
    NSLog(@"gesture tap");
}

#pragma mark - UIButton Method
-(IBAction)buttonclick:(id)sender{
    NSLog(@"button click");
}

#pragma mark - NSNoticification
-(void)getNoti:(NSNotification*)noti{
    NSLog(@"get noti");
}

#pragma mark - NSTimer
-(void)repeatAction{
    NSLog(@"timer action...");
}

#pragma mark -KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"value"])
    {
        NSLog(@"kvo:%@",object);
    }
}

#pragma mark -DelayAction
-(void)delayAction{
    NSLog(@"delay action");
}

#pragma mark -
-(void)dealloc{
    NSLog(@"customview release");
  
#ifdef USER_DEPENDENCY_SELF
    [[NSNotificationCenter defaultCenter] removeObserver:self];
#endif

    [super dealloc];
}

@end
