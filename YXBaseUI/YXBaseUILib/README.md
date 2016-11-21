
#YXBaseUILib说明
---
##感谢
* 这个库中参考了不规则`tabBar`，感谢作者，git地址https://github.com/jiangyongjian/IrregularTabBar
* 另外还有自定义的`navigationController`，同样感谢作者，git地址https://github.com/rickytan/RTRootNavigationController
* 当然还有`MBProgressHUD`的作者，git地址https://github.com/jdg/MBProgressHUD

##特点
---
* `tabbar`半自定义，可使用大图标不规则元素，以及所有系统功能，当需要使用大图标的时候，需在`tabbar`的相应位置空出一个按钮位置，在`tabbarController`执行完`setUpTabBar`方法之后执行`setupBigButtonWithImageName:(参数省略)`方法
* `navigation`纯自定义，每个控制器的`navigationController`是相互独立的，所以可以针对每一个控制器个性化处理
* pop时采用最流行的阿里pop方式（导航条随页面一起滑动）
* 控制器纯自定义，提供根导航条接口、`barButtonItem`自定义接口，和常用的hud提示
* 开发常用类目

##调用须知
---
* 先用cocoapods建立主工程和UI库的依赖关系，例如：
        workspace 'YXBaseUI'
        xcodeproj 'YXBaseUILib/YXBaseUILib.xcodeproj'
        xcodeproj 'YXBaseUIDemo/YXBaseUIDemo.xcodeproj'

        target 'YXBaseUILib' do
            platform:ios, '7.0'

            xcodeproj 'YXBaseUILib/YXBaseUILib.xcodeproj'
        end

        target 'YXBaseUIDemo' do
            platform:ios, '7.0'

            xcodeproj 'YXBaseUIDemo/YXBaseUIDemo.xcodeproj'
        end
* 在主工程引入`#import "YXBaseUILib/YXBaseUILib.h"`
* 将`yx_image_source.bundle`导入到主工程
* 项目中创建的导航控制器、选项卡控制器、视图控制器要继承库中响应的基类
* 在`YXBaseViewController`中我们有默认的自定义导航栏属性，如果你需要更改它那么需要重写它子类的`- (void)viewWillAppear:(BOOL)animated`方法，同时我们设置了视图控制器的显示方式是全屏，所以带有导航条界面中的第一个可视点y值从`64`开始
* 要实现`rightBarButtonItem`方法时，需要重写`- (void)onActionNextBtnClick`
* 当你需要设置某个控制器对应的tabBar角标时，你需要像这样`self.yx_navigationController.tabBarItem.badgeValue = @"6";`
* 有部分内部方法基于`MBProgressHUD`封装，请勿重复引入
* 视图控制器和导航控制器之间是这样的关系
                        baseNav
            一一一一一一一一一一一一一一一一一一一
            |               |               |
        contentNav      contentNav      contentNav
            |               |               |
        viewController      vc              vc

