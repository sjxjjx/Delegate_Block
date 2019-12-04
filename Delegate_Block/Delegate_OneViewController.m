//
//  Delegate_OneViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "Delegate_OneViewController.h"
#import "Delegate_TwoViewController.h"

@interface Delegate_OneViewController ()<Delegate_TwoViewControllerDelegate>

/** 跳转界面 */
@property(nonatomic, strong) Delegate_TwoViewController *twoVc;

@end

@implementation Delegate_OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBtn];
}

- (void)setupBtn {
    @weakify(self);
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 按钮点击
        [self.navigationController pushViewController:self.twoVc animated:YES];
    }];
}

#pragma mark - <Delegate_TwoViewControllerDelegate>
- (void)delegate_TwoVcTest {
    NSLog(@"这里是delegate的代理回调");
}

#pragma mark - <懒加载>
- (Delegate_TwoViewController *)twoVc {
    if (!_twoVc) {
        _twoVc = [[Delegate_TwoViewController alloc] init];
        _twoVc.delegate = self;
    }
    return _twoVc;
}

@end
