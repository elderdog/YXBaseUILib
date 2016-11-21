//
//  YXTabBar.m
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/19.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "YXTabBar.h"
#import "YXTabBarBigButton.h"
#import "YXExtension.h"
#import "YXMarco.h"

@interface YXTabBar ()

@property (nonatomic, strong) YXTabBarBigButton *bigButton;
@property (nonatomic, assign) NSInteger bigButtonIndex;

@end

@implementation YXTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:kYxBundle(@"yx_tab_bg")]]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置bigButton的frame
    CGRect rect = self.bounds;
    CGFloat width = rect.size.width / self.items.count - 1;
    self.bigButton.frame = CGRectInset(rect, self.bigButtonIndex * width, 0);
    [self bringSubviewToFront:self.bigButton];
}

// 响应者链判断事件归哪个view管
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    // 拿到点相对于大按钮的坐标
    CGPoint newPoint = [self convertPoint:point toView:self.bigButton.imageView];
    // 判断坐标在不在大按钮上
    if ([self.bigButton.imageView pointInside:newPoint withEvent:event]) {
        return self.bigButton;
    }
    return [super hitTest:point withEvent:event];
}

- (void)setupBigButtonWithImageName:(NSString *)imageName
               highlightedImageName:(NSString *)highlightedImageName
                              title:(NSString *)title
                   normalTitleColor:(UIColor *)normalTitleColor
              highlightedTitleColor:(UIColor *)highlightedTitleColor
                              index:(NSInteger)index
                         eventBlock:(void (^)(YXTabBarBigButton *bigButton))block
{
    self.bigButton = [[YXTabBarBigButton alloc] init];
    [self.bigButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.bigButton setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [self.bigButton setTitle:title forState:UIControlStateNormal];
    [self.bigButton setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [self.bigButton setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    //设置bigButton的frame
    self.bigButtonIndex = index;
    CGRect rect = self.bounds;
    CGFloat width = rect.size.width / self.items.count - 1;
    self.bigButton.frame = CGRectInset(rect, self.bigButtonIndex * width, 0);
    [self addSubview:self.bigButton];
    [self bringSubviewToFront:self.bigButton];
    if (block) {
        block(self.bigButton);
    }
}

@end
