//
//  YXBaseTabBarController.h
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/15.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXBaseNavigationController;
@class YXTabBarBigButton;

@interface YXBaseTabBarController : UITabBarController

/**
 *  添加一个子控制器
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */
- (void)addOneChildVC:(YXBaseNavigationController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

/**
 *  自定义TabBar(一定要在添加完子控制器之后调用)
 */
- (void)setUpTabBar;

/**
 *  设置一个大按钮
 */
- (void)setupBigButtonWithImageName:(NSString *)imageName
               highlightedImageName:(NSString *)highlightedImageName
                              title:(NSString *)title
                   normalTitleColor:(UIColor *)normalTitleColor
              highlightedTitleColor:(UIColor *)highlightedTitleColor
                              index:(NSInteger)index
                        tabBarBlock:(void (^)(YXTabBarBigButton *bigButton))block;

@end
