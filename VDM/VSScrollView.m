//
//  VSScrollView.m
//  test
//
//  Created by Xiang on 14-3-25.
//  Copyright (c) 2014年 Vip. All rights reserved.
//

#import "VSScrollView.h"
#import "VSDependencyManager.h"

@implementation  UIScrollView(VSScrollView)

//setDelegate
-(void)setScrollDelegate:(id)delegate{
    //
    [self setScrollDelegate:delegate];
    [[VSDependencyManager shareInstance] addObserver:delegate source:self];
}

@end
