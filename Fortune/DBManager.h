//
//  DBManager.h
//  Fortune
//
//  Created by yons on 13-8-19.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"
#import "FMDatabase.h"

@interface DBManager : NSObject
{
    FMDatabase *db;

}
+ (id)sharedInstance;
-(BaseObject *)dictionaryToObject:(NSDictionary *)dictionary;
-(NSArray *)quaryBazihehun;
-(NSArray *)quaryGongsiquming;

-(NSArray *)quaryGuaming;
-(BaseObject *)getObjByContent:(NSString *)key;

-(NSArray *)quaryJinriliangyan;
-(NSArray *)quaryJujiafengshui;
-(NSArray *)quaryQuming;

@end
