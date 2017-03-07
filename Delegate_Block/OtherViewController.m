//
//  OtherViewController.m
//  Delegate_Block
//
//  Created by sjx on 2017/3/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController (){
    UILabel *_otherTestLabel;
    UIButton *_otherTestButton_1;
    UIButton *_otherTestButton_2;
}

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"子控制器";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    _otherTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
    _otherTestLabel.font = [UIFont systemFontOfSize:17.0];
    _otherTestLabel.textColor = [UIColor blackColor];
    if (self.pushString) {
        _otherTestLabel.text = self.pushString;
    } else {
        _otherTestLabel.text = @"测试数据";    
    }
    _otherTestLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_otherTestLabel];
    
    // 代理方式
    _otherTestButton_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_otherTestButton_1 setTitle:@"代理方式返回" forState:UIControlStateNormal];
    [_otherTestButton_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _otherTestButton_1.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 80)/2, 300, 120, 30);
    _otherTestButton_1.backgroundColor = [UIColor orangeColor];
    [_otherTestButton_1 addTarget:self action:@selector(backClickWithDelegate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_otherTestButton_1];
    
    // Block方式
    _otherTestButton_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_otherTestButton_2 setTitle:@"Block方式返回" forState:UIControlStateNormal];
    [_otherTestButton_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _otherTestButton_2.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 80)/2, 400, 120, 30);
    _otherTestButton_2.backgroundColor = [UIColor orangeColor];
    [_otherTestButton_2 addTarget:self action:@selector(backClickWithBlock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_otherTestButton_2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backClickWithDelegate
{
    if ([self.delegate respondsToSelector:@selector(popVCWithString:)]) {
        [self.delegate popVCWithString:@"通过代理从子控制器传回的字符串"];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backClickWithBlock
{
    self.popBlock(@"通过Block从子控制器传回的字符串");
    [self.navigationController popViewControllerAnimated:YES];
}

@end
