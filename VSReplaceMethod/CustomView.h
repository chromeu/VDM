//
//  CustomView.h
//  VSReplaceMethod
//
//  Created by Xiang on 14-3-26.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIScrollViewDelegate>
{
    NSTimer *timer;
}

-(void)tap:(UIGestureRecognizer*)tap;

-(IBAction)buttonclick:(id)sender;

@end
