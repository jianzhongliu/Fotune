//
//  FortuneController.m
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "FortuneController.h"

@implementation FortuneController

-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect tempRect = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    UIImageView * textbg = [[UIImageView alloc]  initWithFrame:tempRect];
    textbg.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    [self.view addSubview:textbg];
    self.view.backgroundColor=[UIColor greenColor];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    UIButton *bu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    bu.frame = CGRectMake(0, 50, 320, 40);
    [bu addTarget:self action:@selector(timeout) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bu];
    
    image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menuicon_ser.png"]];
    image.frame=CGRectMake(50, 200, 60, 60);
    [self.view addSubview:image];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

#pragma mark - privateMethods
-(void)timeout{
    index = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(time) userInfo:nil repeats:YES];
}

-(void)time{
        NSLog(@"%d",arc4random()%2);
    
    if(index == 81){
        [timer invalidate];
        NSLog(@"您的签%d",arc4random()%2);
    }
    if(arc4random()%2){
    image.image=[UIImage imageNamed:@"menuicon_ser.png"];
    }else{
    image.image=[UIImage imageNamed:@"menuicon_set.png"];
    }
    
    
    index ++;
}
@end
