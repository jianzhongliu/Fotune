//
//  ViewController.h
//  Fortune
//
//  Created by yons on 13-8-15.
//  Copyright (c) 2013年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTMainTabController : UITabBarController <UITabBarControllerDelegate>
{
    UIView      *_contentView;
    UIImageView *_selectView;
    int         _viewSelectedIndex;
}
@end
