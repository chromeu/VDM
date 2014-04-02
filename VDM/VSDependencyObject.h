//
//  VSDependencyObject.h
//  VSReplaceMethod
//
//  Created by YaoMing on 14-3-24.
//  Copyright (c) 2014年 YaoMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSDependencyObject : NSObject
@property (nonatomic,strong)id resource;
@property (nonatomic,strong)NSString *key;

- (id)initWithResource:(id)resource key:(NSString *)key;
@end
