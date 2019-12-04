//
//  Delegate_TwoViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "Delegate_TwoViewController.h"

@interface Delegate_TwoViewController ()

@end

@implementation Delegate_TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(delegate_TwoVcTest)]) {
        [self.delegate delegate_TwoVcTest];
    }
}

@end
