//
//  YXBaseViewController.h
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/13.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXBaseNavigationController;

@interface YXBaseViewController : UIViewController

#warning 如果想要更改导航栏属性，需在子类中重写viewwillappear方法
#warning 设置角标要这样self.yx_navigationController.tabBarItem.badgeValue = @"6";

#pragma mark - 关键属性
/**
 *  是否关闭边缘pop手势
 */
@property (nonatomic, assign) IBInspectable BOOL yx_disableInteractivePop;

/**
 *  获取此控制器所在的YXBaseNavigationController
 */
@property (nonatomic, readonly, strong) YXBaseNavigationController *yx_navigationController;

/**
 *  @brief Override this method to provide a custom subclass of @c UINavigationBar, defaults return nil
 *
 *  @return new UINavigationBar class
 */
- (Class)yx_navigationBarClass;

#pragma mark - 设置barButtonItem
@property (nonatomic, strong) UIColor *barButtonTintColor;// 默认白色
- (void)setupLeftBarButtonItemWithPreTitle;
- (void)setupLeftBarButtonItem:(NSString*)barTitle HasBackIcon:(BOOL)hasBackIcon;
- (void)onActionBackBtnClick;
- (void)setupRightBarButtonItem:(NSString*)barTitle;
- (void)setupRightBarButtonItemWithImage:(UIImage*)image;
- (void)onActionNextBtnClick;

#pragma mark - hud信息提示（菊花）
@property (nonatomic, strong) UIFont *hudLabelFont;
@property (nonatomic, strong) UIColor *hudColor;
@property (nonatomic, assign) CGFloat hudCornerRadius;
- (void)showHudInView:(UIView *)view hint:(NSString *)hint;
- (void)showWaitWithHint:(NSString *)hint;
- (void)showHint:(NSString *)hint;
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;
- (void)showSuccessWithHint:(NSString *)hint;// 图片要37*37
- (void)showFailureWithHint:(NSString *)hint;
- (void)showWarningWithHint:(NSString *)hint;
- (void)showSimpleHud;// just a 菊花,简简单单没字
- (void)hideHud;

@end
