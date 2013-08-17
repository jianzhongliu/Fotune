//
//  FengshuiController.m
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "FengshuiController.h"

@implementation FengshuiController
-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect tempRect = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    UIImageView * textbg = [[UIImageView alloc]  initWithFrame:tempRect];
    textbg.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    [self.view addSubview:textbg];
    self.view.backgroundColor=[UIColor purpleColor];
}

@end
