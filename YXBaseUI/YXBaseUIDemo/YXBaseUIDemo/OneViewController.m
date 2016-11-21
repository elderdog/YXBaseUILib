//
//  OneViewController.m
//  YXBaseUIDemo
//
//  Created by heyuanxiang on 16/8/15.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "OneViewController.h"
#import "ThreeViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"One第一控制器NOTtwo";    
    
    UIButton *btn1 = [self button:50 title:@"showWait"];
    [btn1 addTarget:self action:@selector(showWait) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [self button:100 title:@"showSuccess"];
    [btn2 addTarget:self action:@selector(showSuccess) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [self button:150 title:@"showWarning"];
    [btn3 addTarget:self action:@selector(showWarning) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [self button:200 title:@"showFailure"];
    [btn4 addTarget:self action:@selector(showFailure) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn5 = [self button:250 title:@"hide"];
    [btn5 addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showWait
{
//    [self showHudInView:self.view hint:@"正在加载..."];
//    [self showHint:@"温馨提示：巴拉巴拉"];
    [self showSimpleHud];
}

- (void)showSuccess
{
    [self showSuccessWithHint:@"操作成功"];
}

- (void)showWarning
{
    [self showWarningWithHint:@"警告提示"];
}

- (void)showFailure
{
    [self showFailureWithHint:@"操作失败"];
}

- (void)hide
{
    [self hideHud];
}

- (UIButton *)button:(CGFloat)y title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, y, 100, 50);
    [btn setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:btn];
    return btn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ThreeViewController *vc = [[ThreeViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    vc.barButtonTintColor = [UIColor blackColor];
    [vc setupLeftBarButtonItem:@"返回" HasBackIcon:YES];
    vc.title = @"two控制器NOone";
    vc.hidesBottomBarWhenPushed = YES;
    [self.yx_navigationController pushViewController:vc animated:YES];
    vc.yx_navigationController.tabBarItem.badgeValue = @"90";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
