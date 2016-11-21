//
//  YXTabBar.h
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/19.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXTabBarBigButton;

@interface YXTabBar : UITabBar

/**
 *  创建一个大按钮
 */
- (void)setupBigButtonWithImageName:(NSString *)imageName
               highlightedImageName:(NSString *)highlightedImageName
                              title:(NSString *)title
                   normalTitleColor:(UIColor *)normalTitleColor
              highlightedTitleColor:(UIColor *)highlightedTitleColor
                              index:(NSInteger)index
                         eventBlock:(void (^)(YXTabBarBigButton *bigButton))block;

@end
