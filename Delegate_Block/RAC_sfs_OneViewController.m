//
//  RAC_sfs_OneViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RAC_sfs_OneViewController.h"
#import "RAC_sfs_TwoViewController.h"

@interface RAC_sfs_OneViewController ()

/** 跳转界面 */
@property(nonatomic, strong) RAC_sfs_TwoViewController *twoVc;

@end

@implementation RAC_sfs_OneViewController

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
- (RAC_sfs_TwoViewController *)twoVc {
    if (!_twoVc) {
        _twoVc = [[RAC_sfs_TwoViewController alloc] init];
        [[_twoVc rac_signalForSelector:@selector(touchesBegan:withEvent:)] subscribeNext:^(RACTuple * _Nullable x) {
            NSLog(@"rac_signalForSelector监听回调：%@", x);
        }];
    }
    return _twoVc;
}

@end
