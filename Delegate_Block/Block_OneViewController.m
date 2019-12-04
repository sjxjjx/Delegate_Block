//
//  Block_OneViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "Block_OneViewController.h"
#import "Block_TwoViewController.h"

@interface Block_OneViewController ()

/** 跳转界面 */
@property(nonatomic, strong) Block_TwoViewController *twoVc;

@end

@implementation Block_OneViewController

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

#pragma mark - <懒加载>
- (Block_TwoViewController *)twoVc {
    if (!_twoVc) {
        _twoVc = [[Block_TwoViewController alloc] init];
        _twoVc.twoVcBlock = ^{
            NSLog(@"这里是block回调");
        };
    }
    return _twoVc;
}

@end
