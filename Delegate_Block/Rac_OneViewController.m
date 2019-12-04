//
//  Rac_OneViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "Rac_OneViewController.h"
#import "Rac_TwoViewController.h"

@interface Rac_OneViewController ()

/** 跳转界面 */
@property(nonatomic, strong) Rac_TwoViewController *twoVc;

@end

@implementation Rac_OneViewController

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
- (Rac_TwoViewController *)twoVc {
    if (!_twoVc) {
        _twoVc = [[Rac_TwoViewController alloc] init];
        _twoVc.delegateSubject = [RACSubject subject];
        [_twoVc.delegateSubject subscribeNext:^(id  _Nullable x) {
            NSLog(@"这里是RACSubject接受到的信号信息：%@", x);
        }];
    }
    return _twoVc;
}

@end
