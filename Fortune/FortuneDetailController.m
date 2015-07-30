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
    
    BaseObject *baseobject=[[DBManager sharedInstance] getObjByContent:_key];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *rule = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 500)];
    [rule setFont:[UIFont systemFontOfSize:12]];
    rule.lineBreakMode = NSLineBreakByWordWrapping;
    rule.backgroundColor = [UIColor clearColor];
    rule.numberOfLines = 0;
    rule.text = [NSString stringWithFormat:@"%@", baseobject.content];
    [self.view addSubview:rule];
}

@end
