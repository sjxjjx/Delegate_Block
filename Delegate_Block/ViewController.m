//
//  ViewController.m
//  Delegate_Block
//
//  Created by sjx on 2017/3/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"

@interface ViewController ()<OtherViewControllerDelegate>
{
    UILabel *_testLabel;
    UIButton *_testButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"根控制器";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
    _testLabel.font = [UIFont systemFontOfSize:17.0];
    _testLabel.textColor = [UIColor blackColor];
    _testLabel.text = @"测试数据";
    _testLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_testLabel];
    
    _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_testButton setTitle:@"进入" forState:UIControlStateNormal];
    [_testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _testButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 80)/2, 300, 80, 30);
    _testButton.backgroundColor = [UIColor orangeColor];
    [_testButton addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_testButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <按钮点击事件>
- (void)testButtonClick
{
    OtherViewController *otherVC = [[OtherViewController alloc] init];
    otherVC.pushString = @"从根控制器传入的字符串";
    otherVC.delegate = self;
    otherVC.popBlock = ^(NSString *popString) {
        _testLabel.text = popString;
    };
    [self.navigationController pushViewController:otherVC animated:YES];
}

- (void)popVCWithString:(NSString *)popString
{
    _testLabel.text = popString;
}

@end
