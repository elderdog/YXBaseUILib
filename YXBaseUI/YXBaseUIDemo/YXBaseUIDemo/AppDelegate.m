//
//  AppDelegate.m
//  YXBaseUIDemo
//
//  Created by heyuanxiang on 16/8/9.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "YXTabBarBigButton.h"

@interface AppDelegate ()

{
    OneViewController *one;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //
    YXBaseTabBarController *tabbarCtrl = [[YXBaseTabBarController alloc] init];
    self.window.rootViewController = tabbarCtrl;
    
    one = [[OneViewController alloc] init];
    YXBaseNavigationController *nav1 = [[YXBaseNavigationController alloc] initWithRootViewController:one];
    [tabbarCtrl addOneChildVC:nav1 title:@"one" imageName:@"tabBar_icon_schedule_default" selectedImageName:@"tabBar_icon_schedule"];
    
    TwoViewController *two = [[TwoViewController alloc] init];
    YXBaseNavigationController *nav2 = [[YXBaseNavigationController alloc] initWithRootViewController:two];
    [tabbarCtrl addOneChildVC:nav2 title:nil imageName:nil selectedImageName:nil];
//    [tabbarCtrl addOneChildVC:nav2 title:@"two" imageName:@"tabBar_icon_customer_default" selectedImageName:@"tabBar_icon_customer"];
    
    TwoViewController *three = [[TwoViewController alloc] init];
    YXBaseNavigationController *nav3 = [[YXBaseNavigationController alloc] initWithRootViewController:three];
    [tabbarCtrl addOneChildVC:nav3 title:@"three" imageName:@"tabBar_icon_customer_default" selectedImageName:@"tabBar_icon_customer"];
    
    [tabbarCtrl setUpTabBar];
    
    __weak typeof(self) weekSelf = self;
    [tabbarCtrl setupBigButtonWithImageName:@"摄影机图标_点击前" highlightedImageName:@"摄影机图标_点击后" title:@"two" normalTitleColor:RGB(113, 109, 104) highlightedTitleColor:RGB(51, 135, 255) index:1 tabBarBlock:^(YXTabBarBigButton *bigButton) {
        [bigButton addTarget:weekSelf action:@selector(bigAction)];
    }];
    
    return YES;
}

- (void)bigAction
{
    NSLog(@"大按钮");
    [one showHint:@"点了个大按钮"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
