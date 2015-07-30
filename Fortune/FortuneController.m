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
    BOOL status;
}
@end

@implementation FortuneController

-(void)viewDidLoad{
    [super viewDidLoad];
    status = NO;
    UILabel *rule = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 150)];
    [rule setFont:[UIFont systemFontOfSize:12]];
    rule.lineBreakMode = NSLineBreakByWordWrapping;
    rule.backgroundColor = [UIColor clearColor];
    rule.numberOfLines = 0;
//    rule.text = @"先点击\"开始\"，诚心求满6签之后就会得到求签的结果，点击\"看结果\"去查看结果";
    [self.view addSubview:rule];
    CGRect tempRect = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    UIImageView * textbg = [[UIImageView alloc]  initWithFrame:tempRect];
    textbg.image = [UIImage imageNamed:@"navigationbar_bg.png"];
    [self.view addSubview:textbg];
    self.view.backgroundColor=[UIColor lightGrayColor];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    bu=[UIButton buttonWithType:UIButtonTypeCustom];
    [bu setBackgroundColor:[UIColor purpleColor]];
    bu.tag = 0;
    bu.frame = CGRectMake(0, 50, 320, 40);
    [bu setTitle:@"button" forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(timeout) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bu];
    
    image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menuicon_ser.png"]];
    image.frame=CGRectMake(50, 200, 60, 60);
    image.alpha = 0.0f;
    [self.view addSubview:image];

    butGo=[UIButton buttonWithType:UIButtonTypeCustom];
    [butGo setBackgroundColor:[UIColor purpleColor]];
    [butGo setTitle:@"结果" forState:UIControlStateNormal];
    butGo.frame=CGRectMake(200, 300, 80, 60);
    [butGo addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:butGo];
}

-(void)go{
    FortuneDetailController *controller = [[FortuneDetailController alloc] init];
    controller.key = keywordsString;
    self.navigationController.navigationBar.hidden = NO;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:nav animated:YES completion:^{
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    keywordsString = [NSMutableString string];
}

#pragma mark - privateMethods
-(void)timeout{

    timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(time) userInfo:nil repeats:YES];
}

-(void)time{
    int i = arc4random()%2;
    if (status) {
        return;
    }
    if (keywordsString.length < 6) {
        if(i / 2.0f > 1/2){
            [keywordsString appendString:@"叉"];
        }else{
            [keywordsString appendString:@"圈"];
        }
    } else if (keywordsString.length == 6){
        status = YES;
        [self go];
    }
}

@end
