//
//  BaseObject.h
//  Fortune
//
//  Created by yons on 13-8-19.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject

@property(strong, nonatomic)NSString *ID;
@property(strong, nonatomic)NSString *title;
@property(strong, nonatomic)NSString *content;
@end
