//
//  YXBaseTabBarController.m
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/15.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "YXBaseTabBarController.h"
#import "YXBaseNavigationController.h"
#import "YXTabBar.h"
#import "YXMarco.h"

#define kTabbarHeight 49
#define kNormalColor    RGB(113, 109, 104)
#define kSelectedColor  RGB(51, 135, 255)

@interface YXBaseTabBarController ()

@property (nonatomic, strong) YXTabBar *myTabBar;

@end

@implementation YXBaseTabBarController

+ (void)initialize {
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kNormalColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = kSelectedColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    self.myTabBar = [[YXTabBar alloc] init];
    [self setValue:self.myTabBar forKey:@"tabBar"];
}

#pragma mark - 添加一个子控制器
- (void)addOneChildVC:(YXBaseNavigationController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.tabBarItem.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    [self addChildViewController:childVc];
}

- (void)setupBigButtonWithImageName:(NSString *)imageName
               highlightedImageName:(NSString *)highlightedImageName
                              title:(NSString *)title
                   normalTitleColor:(UIColor *)normalTitleColor
              highlightedTitleColor:(UIColor *)highlightedTitleColor
                              index:(NSInteger)index
                        tabBarBlock:(void (^)(YXTabBarBigButton *bigButton))block
{
    [self.myTabBar setupBigButtonWithImageName:imageName highlightedImageName:highlightedImageName title:title normalTitleColor:normalTitleColor highlightedTitleColor:highlightedTitleColor index:index eventBlock:^(YXTabBarBigButton *bigButton) {
        if (block) {
            block(bigButton);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
