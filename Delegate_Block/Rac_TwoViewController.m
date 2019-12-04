//
//  Rac_TwoViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "Rac_TwoViewController.h"

@interface Rac_TwoViewController ()

@end

@implementation Rac_TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.delegateSubject) {
        [self.delegateSubject sendNext:@"哈哈哈"];
    }
}

@end
