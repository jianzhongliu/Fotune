//
//  FortuneController.h
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "BaseViewContrller.h"

@interface FortuneController : BaseViewContrller
{
    NSTimer *timer;
    int index;
    UIImageView *image;
}
@end
