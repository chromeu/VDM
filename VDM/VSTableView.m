//
//  VSTableView.m
//  test
//
//  Created by Xiang on 14-3-24.
//  Copyright (c) 2014年 Vip. All rights reserved.
//

#import "VSTableView.h"
#import "VSDependencyManager.h"

@implementation UITableView(VSTableView)

//setDelegate
-(void)setTableDelegate:(id)delegate{
    //
    [self setTableDelegate:delegate];
    [[VSDependencyManager shareInstance] addObserver:delegate source:self];
}

//setDataSource
-(void)setTableDataSource:(id)datasoure{
    //
    [self setTableDataSource:datasoure];
    [[VSDependencyManager shareInstance] addObserver:datasoure source:self];
}

@end
