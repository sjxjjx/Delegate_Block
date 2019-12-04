//
//  RootViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - <懒加载>
- (UIButton *)pushBtn {
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushBtn.frame = CGRectMake(40, 200, [UIScreen mainScreen].bounds.size.width - 80, 44);
        [_pushBtn setTitle:@"跳转" forState:UIControlStateNormal];
        [_pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _pushBtn.backgroundColor = [UIColor orangeColor];
        _pushBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [self.view addSubview:_pushBtn];
    }
    return _pushBtn;
}

@end
