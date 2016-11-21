//
//  YXBaseNavigationController.h
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/12.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "RTRootNavigationController.h"
@class YXBaseViewController;

@interface YXBaseNavigationController : RTRootNavigationController

/**
 *  获取当前可正在看到的控制器YXBaseViewController
 */
@property (nonatomic, readonly, strong) YXBaseViewController *yx_visibleViewController;

/**
 *  获取栈顶控制器YXBaseViewController
 */
@property (nonatomic, readonly, strong) YXBaseViewController *yx_topViewController;

/**
 *  获取到所有的底层控制器(类似childViewControllers)
 */
@property (nonatomic, readonly, strong) NSArray <__kindof YXBaseViewController *> *yx_viewControllers;

@end
