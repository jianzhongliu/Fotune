//
//  BaseViewContrller.m
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "BaseViewContrller.h"

@implementation BaseViewContrller
-(void)viewDidLoad{
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

@end
