//
//  FortuneDetailController.m
//  Fortune
//
//  Created by yons on 13-8-20.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import "FortuneDetailController.h"
#import "DBManager.h"

@interface FortuneDetailController ()

@end

@implementation FortuneDetailController
@synthesize key = _key;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    BaseObject *base=[[DBManager sharedInstance] getObjByContent:_key];
    NSLog(@"%@==%@",self.key, base.content);

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
