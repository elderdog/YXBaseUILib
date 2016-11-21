//
//  YXMarco.h
//  YXBaseUILib
//
//  Created by heyuanxiang on 16/8/11.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#ifndef YXMarco_h
#define YXMarco_h

// 资源路径
#define kYxBundle(str)         [NSString stringWithFormat:@"yx_image_source.bundle/%@", str]

#pragma mark - 颜色宏定义
#define RGB(r,g,b)             [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]
#define RGBA(r,g,b,a)          [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]

#pragma mark - 屏幕尺寸定义
#define kScreenHeight          [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth           [[UIScreen mainScreen] bounds].size.width

#endif /* YXMarco_h */
