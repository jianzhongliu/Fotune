//
//  SetingController.m
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "SettingController.h"
#import "DBManager.h"

@implementation SettingController
-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect tempRect = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    UIImageView * textbg = [[UIImageView alloc]  initWithFrame:tempRect];
    textbg.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    [self.view addSubview:textbg];
    self.view.backgroundColor=[UIColor grayColor];
    
    //创建数据库文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"DB.sqlite"];
    NSLog(@"%@",dbPath);
    
    db= [FMDatabase databaseWithPath:dbPath];
//    db = [[FMDatabase alloc]initWithPath:[[NSBundle mainBundle] pathForResource:@"DB.sqlite" ofType:nil]];
    if (![db open]) {
        return ;
    }
//    //创建表
//    [db executeUpdate:@"CREATE TABLE Users(Name text, Age integer)"];
//    //插入数据
//    [db executeUpdate:@"INSERT INTO Users(Name, Age) VALUES(?, ?)", @"Eric", [NSNumber numberWithInt:25]]  ;
//    //更新数据
//    [db executeUpdate:@"UPDATE Users SET Name = ? WHERE Name = ? ",@"Michael", @"Eric"];
//    //
//    [db executeUpdate:@"DELETE FROM Users WHERE Name = ?", @"Michael"];
//    
//    //查询数据
//    FMResultSet *rs = [db executeQuery:@"SELECT * FROM Users"];
//    rs = [db executeQuery:@"SELECT * FROM Users WHERE Age = ?", @"25"];
//    while ([rs next]){
//        NSLog(@"%@ %@", [rs stringForColumn:@"Name"], [rs stringForColumn:@"Age"]);
//    }
//    [rs close];
    
    
    but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(0, 0, 320, 40);
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [but setTitle:@"创建表" forState:UIControlStateNormal];
    but.tag = 109;
    [self.view addSubview:but];
    but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(0, 100, 320, 40);
    but.tag = 101;
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [but setTitle:@"插入数据" forState:UIControlStateNormal];
    [self.view addSubview:but];
    but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(0, 200, 320, 40);
    but.tag = 102;
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [but setTitle:@"更新数据" forState:UIControlStateNormal];
    [self.view addSubview:but];
    but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(0, 300, 320, 40);but.tag=103;
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [but setTitle:@"删除数据" forState:UIControlStateNormal];
    [self.view addSubview:but];
    but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(0, 350, 320, 40);but.tag = 104;
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    [but setTitle:@"查询数据" forState:UIControlStateNormal];
    [self.view addSubview:but];

}
-(void)click:(id)sender{
    UIButton *bu = (UIButton *)sender;
    NSLog(@"%d",bu.tag);
    if(bu.tag == 109){
        [db executeUpdate:@"CREATE TABLE jujiafengshui(ID integer, title text, content text)"];
    }
    if(bu.tag == 101){
        [self insertValue];
//        [db executeUpdate:@"INSERT INTO gongsiquming(Name, Age) VALUES(?, ?)", @"Eric", [NSNumber numberWithInt:25]]  ;
    }
    if(bu.tag == 102){
      BaseObject *base = [[DBManager sharedInstance] getObjByContent:@"圈圈圈叉叉叉"];
        NSLog(@"%@",base.content);
//        [db executeUpdate:@"UPDATE gongsiquming SET Name = ? WHERE Name = ? ", @"Michael", @"Eric"];
    }
    if(bu.tag == 103){
//        [db executeUpdate:@"DELETE FROM Users WHERE Name = ?", @"Michael"];
    }
    if(bu.tag == 104){
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM jujiafengshui"];
        rs = [db executeQuery:@"SELECT * FROM jujiafengshui"];
        while ([rs next]){
            NSLog(@"%@ %@", [rs stringForColumn:@"ID"], [rs stringForColumn:@"title"]);
        }
        [rs close];
    }
}
-(void)insertValue{
    NSMutableString *str = [[NSMutableString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jujiafengshui.txt" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str);
    NSArray *suparr = [str componentsSeparatedByString:@"==="];
    int i = 0;
    for (NSString *tempstr in suparr) {
        i++;
        NSArray *Subarr = [tempstr componentsSeparatedByString:@"=="];
        NSLog(@"%@",[Subarr objectAtIndex:0]);
        [db executeUpdate:@"INSERT INTO jujiafengshui(ID, title, content) VALUES(?, ?, ?)", [NSNumber numberWithInt:i], [Subarr objectAtIndex:0], [Subarr objectAtIndex:1]];
    }
}
@end
