//
//  YXBaseNavigationController.m
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/12.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "YXBaseNavigationController.h"
#import "YXBaseViewController.h"

@interface YXBaseNavigationController ()

@end

@implementation YXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (YXBaseViewController *)yx_topViewController
{
    return (YXBaseViewController *)[self rt_topViewController];
}

- (YXBaseViewController *)yx_visibleViewController
{
    return (YXBaseViewController *)[self rt_visibleViewController];
}

- (NSArray<YXBaseViewController *> *)yx_viewControllers
{
    return (NSArray<YXBaseViewController *> *)[self rt_viewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
