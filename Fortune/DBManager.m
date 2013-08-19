//
//  DBManager.m
//  Fortune
//
//  Created by yons on 13-8-19.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

+ (id)sharedInstance
{
    static dispatch_once_t pred;
    static DBManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[DBManager alloc] init];
    });
    return sharedInstance;
}

-(BaseObject *)dictionaryToObject:(NSDictionary *)dictionary{
    BaseObject *base=[[BaseObject alloc]init];
    base.ID = [NSString stringWithFormat:@"%@",[dictionary objectForKey:@"ID"]];
    base.title = [dictionary objectForKey:@"title"];
    base.content = [dictionary objectForKey:@"content"];
    return base;
}
-(void)openDB{
   db = [[FMDatabase alloc]initWithPath:[[NSBundle mainBundle] pathForResource:@"DB.sqlite" ofType:nil]];
    if (![db open]) {
        return ;
    }
}
-(NSArray *)quaryBazihehun{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM bazihehun"];
    rs = [db executeQuery:@"SELECT * FROM bazihehun"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}
-(NSArray *)quaryGongsiquming{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM gongsiquming"];
    rs = [db executeQuery:@"SELECT * FROM gongsiquming"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}
#pragma mark - guaming卦名相关的数据库操作
-(NSArray *)quaryGuaming{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM guaming"];
    rs = [db executeQuery:@"SELECT * FROM guaming"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}
-(BaseObject *)getObjByContent:(NSString *)key{
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM guaming"];
    NSString *str=[NSString stringWithFormat:@"SELECT * FROM guaming WHERE content LIKE  '%@%@%@'",@"%", key, @"%"];
    rs = [db executeQuery:str];
    BaseObject *base=[[BaseObject alloc]init];
    while ([rs next]){
    base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
    base.title = [rs stringForColumn:@"title"];
    base.content = [rs stringForColumn:@"content"];
    }
    [rs close];
    return base;
}

-(NSArray *)quaryJinriliangyan{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM jinriliangyan"];
    rs = [db executeQuery:@"SELECT * FROM jinriliangyan"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}
-(NSArray *)quaryJujiafengshui{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM jujiafengshui"];
    rs = [db executeQuery:@"SELECT * FROM jujiafengshui"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}
-(NSArray *)quaryQuming{
    NSMutableArray *arr=[NSMutableArray array];
    [self openDB];
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM quming"];
    rs = [db executeQuery:@"SELECT * FROM quming"];
    while ([rs next]){
        BaseObject *base=[[BaseObject alloc]init];
        base.ID = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"ID"]];
        base.title = [rs stringForColumn:@"title"];
        base.content = [rs stringForColumn:@"title"];
        [arr addObject:base];
    }
    [rs close];
    return arr;
}

@end
