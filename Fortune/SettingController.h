//
//  SetingController.h
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "BaseViewContrller.h"
#import "FMDatabase.h"

@interface SettingController : BaseViewContrller
{
    FMDatabase *db;
    UIButton *but;
}
@end
