//
//  VSPickerView.m
//  test
//
//  Created by Xiang on 14-3-25.
//  Copyright (c) 2014年 Vip. All rights reserved.
//

#import "VSPickerView.h"
#import "VSDependencyManager.h"

@implementation UIPickerView(VSPickerView)

//setDelegate
-(void)setPickerDelegate:(id)delegate{
    //
    [self setPickerDelegate:delegate];
    if (delegate) {
        [[VSDependencyManager shareInstance] addObserver:delegate source:self];
        self.userInteractionEnabled = YES;
    }else{
        self.userInteractionEnabled = NO;
    }
}

//setDataSource
-(void)setPickerDataSource:(id)datasoure{
    //
    [self setPickerDataSource:datasoure];
    if (datasoure) {
        [[VSDependencyManager shareInstance] addObserver:datasoure source:self];
        self.userInteractionEnabled = YES;
    }else{
        self.userInteractionEnabled = NO;
    }
}

@end
