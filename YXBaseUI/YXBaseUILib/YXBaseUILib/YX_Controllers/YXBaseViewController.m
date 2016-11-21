//
//  YXBaseViewController.m
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/13.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "YXBaseViewController.h"
#import <objc/runtime.h>
#import "YXBaseNavigationController.h"
#import "MBProgressHUD.h"
#import "YXMarco.h"
#import "YXExtension.h"

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@interface YXBaseViewController ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation YXBaseViewController

#pragma mark - 生命周期
- (instancetype)init
{
    if (self = [super init]) {
        if ([self respondsToSelector:@selector(setExtendedLayoutIncludesOpaqueBars:)]) {
            self.extendedLayoutIncludesOpaqueBars = YES;
        }
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            self.edgesForExtendedLayout = UIRectEdgeAll;
        }
        if ([self respondsToSelector:@selector(setModalPresentationCapturesStatusBarAppearance:)]) {
            self.modalPresentationCapturesStatusBarAppearance = YES;
        }
        if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 默认背景白色
    self.view.backgroundColor = [UIColor whiteColor];
    // 默认TintColor白色
    self.barButtonTintColor = [UIColor whiteColor];
    // 默认菊花背景黑色
    self.hudColor = [UIColor colorWithWhite:0 alpha:0.6];
    // 默认菊花字体
    self.hudLabelFont = [UIFont systemFontOfSize:14];
    // 默认菊花圆角大小
    self.hudCornerRadius = 5.0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置导航栏的默认背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    // 设置导航栏的默认字体属性
    NSShadow *shadow = [[NSShadow alloc] init];
    //    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    //    shadow.shadowOffset = CGSizeMake(0, 1);
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, shadow, NSShadowAttributeName,[UIFont fontWithName:@"GillSans-Light" size:16.0], NSFontAttributeName,nil]];
    //    @"GillSans-Light"
    //    @"Thonburi-Light"
}

#pragma mark - 导航控制器相关
@dynamic yx_disableInteractivePop;

- (void)setYx_disableInteractivePop:(BOOL)yx_disableInteractivePop
{
    objc_setAssociatedObject(self, @selector(yx_disableInteractivePop), @(yx_disableInteractivePop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yx_disableInteractivePop
{
    return [objc_getAssociatedObject(self, @selector(yx_disableInteractivePop)) boolValue];
}

- (Class)yx_navigationBarClass
{
    return nil;
}

- (YXBaseNavigationController *)yx_navigationController
{
    UIViewController *vc = self;
    while (vc && ![vc isKindOfClass:[YXBaseNavigationController class]]) {
        vc = vc.navigationController;
    }
    return (YXBaseNavigationController *)vc;
}

#pragma mark - 设置barButtonItem
- (void)setupLeftBarButtonItemWithPreTitle {
    if (!self.yx_navigationController) {
        return;
    }
    NSInteger index = [self.yx_navigationController.yx_viewControllers indexOfObject:self];
    if(index == 0) {
        return;
    }
    YXBaseViewController *ctrl = [self.yx_navigationController.yx_viewControllers objectAtIndex:(index-1)];
    [self setupLeftBarButtonItem:ctrl.title HasBackIcon:YES];
}

- (void)setupLeftBarButtonItem:(NSString*)barTitle HasBackIcon:(BOOL)hasBackIcon
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    if(hasBackIcon) {
        [leftBtn setImage:[UIImage imageNamed:kYxBundle(@"yx_nav_left")] forState:UIControlStateNormal];
    }
    leftBtn.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:14.0];
    [leftBtn setTintColor:self.barButtonTintColor];
    [leftBtn setTitle:barTitle forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [leftBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    
    if([barTitle length] > 0 || hasBackIcon) {
        [leftBtn addTarget:self action:@selector(onActionBackBtnClick) forControlEvents:
         UIControlEventTouchUpInside];
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

- (void)onActionBackBtnClick
{
    [self.yx_navigationController popViewControllerAnimated:YES];
}

- (void)setupRightBarButtonItem:(NSString*)barTitle
{
    if([barTitle length] > 0) {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        rightBtn.contentEdgeInsets = UIEdgeInsetsMake(1, 0, 0, 0);
        [rightBtn setTintColor:self.barButtonTintColor];
        [rightBtn setTitle:barTitle forState:UIControlStateNormal];
        [rightBtn sizeToFit];
        [rightBtn addTarget:self action:@selector(onActionNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    }
    else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)setupRightBarButtonItemWithImage:(UIImage*)image
{
    if(image) {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        rightBtn.contentEdgeInsets = UIEdgeInsetsMake(1, 0, 0, 0);
        [rightBtn setTintColor:self.barButtonTintColor];
        [rightBtn setTitle:@"" forState:UIControlStateNormal];
        [rightBtn setImage:image forState:UIControlStateNormal];
        [rightBtn sizeToFit];
        [rightBtn addTarget:self action:@selector(onActionNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    }
    else {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)onActionNextBtnClick
{
    // do something
}

- (UIBarButtonItem *)customBackItemWithTarget:(id)target
                                       action:(SEL)action
{
    
    return [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil)
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

#pragma mark - 菊花相关
// 懒加载
- (MBProgressHUD *)hud
{
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:_hud];
    }
    return _hud;
}

- (void)setCommonAppearanceForHud:(MBProgressHUD *)hud
{
    hud.color = self.hudColor;
    hud.labelFont = self.hudLabelFont;
    hud.cornerRadius = self.hudCornerRadius;
    hud.userInteractionEnabled = NO;
}

- (void)showWaitWithHint:(NSString *)hint
{
    [self showHudInView:self.view hint:hint];
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    [self setCommonAppearanceForHud:self.hud];
    _hud.labelText = hint;
    [_hud show:YES];
}

- (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud) {
        hud.labelText = hint;
    } else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [self setCommonAppearanceForHud:hud];
        hud.userInteractionEnabled = NO;
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = hint;
        hud.margin = 10.f;
        hud.yOffset = kScreenHeight / 4;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
    }
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud) {
        hud.labelText = hint;
    } else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [self setCommonAppearanceForHud:hud];
        hud.userInteractionEnabled = NO;
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = hint;
        hud.margin = 10.f;
        hud.yOffset = 180;
        hud.yOffset += yOffset;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
    }
}

- (void)showSuccessWithHint:(NSString *)hint
{
    NSString *imageName = kYxBundle(@"yx_hud_success");
    [self showCustomViewWithImageName:imageName Hint:hint];
}

- (void)showFailureWithHint:(NSString *)hint
{
    NSString *imageName = kYxBundle(@"yx_hud_failure");
    [self showCustomViewWithImageName:imageName Hint:hint];
}

- (void)showWarningWithHint:(NSString *)hint
{
    NSString *imageName = kYxBundle(@"yx_hud_warning");
    [self showCustomViewWithImageName:imageName Hint:hint];
}

- (void)showCustomViewWithImageName:(NSString *)imageName Hint:(NSString *)hint
{
    [self setCommonAppearanceForHud:self.hud];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    _hud.labelText = hint;
    [_hud show:YES];
    [_hud hide:YES afterDelay:1];
}

- (void)showSimpleHud// just a 菊花,简简单单没字
{
    [self setCommonAppearanceForHud:self.hud];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.labelText = nil;
    [_hud show:YES];
}

- (void)hideHud
{
    [self.hud hide:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
