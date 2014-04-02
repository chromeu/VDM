//
//  VSDependencyObject.m
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import "VSDependencyObject.h"

@implementation VSDependencyObject
- (id)initWithResource:(id)resource key:(NSString *)key
{
    self = [super init];
    if (self) {
        self.resource = resource;
        self.key = key;
    }
    return self;
}
@end
