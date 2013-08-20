//
//  FortuneController.m
//  Fortune
//
//  Created by yons on 13-8-18.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "FortuneController.h"
#import "FortuneDetailController.h"
@interface FortuneController ()
{
    NSMutableString *keywordsString;
    UIButton *bu;
    UIButton *butGo;
}
@end

@implementation FortuneController

-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect tempRect = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    UIImageView * textbg = [[UIImageView alloc]  initWithFrame:tempRect];
    textbg.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    [self.view addSubview:textbg];
    self.view.backgroundColor=[UIColor greenColor];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    bu=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    bu.tag = 0;
    bu.frame = CGRectMake(0, 50, 320, 40);
    [bu setTitle:@"开始求签" forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(timeout) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bu];
    
    image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menuicon_ser.png"]];
    image.frame=CGRectMake(50, 200, 60, 60);
    [self.view addSubview:image];

    butGo=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    butGo.frame=CGRectMake(200, 300, 60, 60);
    [butGo addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:butGo];
    
}

-(void)go{
    FortuneDetailController *controller = [[FortuneDetailController alloc] init];
    controller.key = keywordsString;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    keywordsString = [NSMutableString string];
}

#pragma mark - privateMethods
-(void)timeout{
    bu.enabled = NO;
    bu.tag = bu.tag+1;
    NSString *tempStr = [NSString stringWithFormat:@"还剩%d签", 6-bu.tag];
    [bu setTitle:tempStr forState:UIControlStateNormal];
    if(bu.tag == 6){
    [bu setTitle:@"最后一签" forState:UIControlStateNormal];
    }
    index = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(time) userInfo:nil repeats:YES];
}

-(void)time{
    int i = arc4random()%2;
    
    if(index == 81){
        if(i){
            [keywordsString appendString:@"圈"];
        }else{
            [keywordsString appendString:@"叉"];
        }
        [timer invalidate];
        NSLog(@"您的签%d",i);
        if(bu.tag == 6){
            bu.enabled = NO;
            [bu setTitle:keywordsString forState:UIControlStateNormal];
        }else{
        bu.enabled = YES;
        }
    }
    if(i){
    image.image=[UIImage imageNamed:@"menuicon_ser.png"];
    }else{
    image.image=[UIImage imageNamed:@"menuicon_set.png"];
    }
    index ++;

}
@end
