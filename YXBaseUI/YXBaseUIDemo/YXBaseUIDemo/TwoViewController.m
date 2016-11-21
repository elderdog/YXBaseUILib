//
//  TwoViewController.m
//  YXBaseUIDemo
//
//  Created by heyuanxiang on 16/8/15.
//  Copyright © 2016年 heyuanxiang. All rights reserved.
//

#import "TwoViewController.h"
#import "GifView.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    GifView *gif = [[GifView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) filePath:[[NSBundle mainBundle] pathForResource:@"beautiful" ofType:@"gif"]];
    [self.view addSubview:gif];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    YXBaseViewController *vc = [[YXBaseViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    vc.hidesBottomBarWhenPushed = YES;
    [self.yx_navigationController pushViewController:vc animated:YES];
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
