//
//  Rac_TwoViewController.h
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RootTwoViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rac_TwoViewController : RootTwoViewController

/** rac代理 */
@property(nonatomic, strong) RACSubject *delegateSubject;

@end

NS_ASSUME_NONNULL_END
