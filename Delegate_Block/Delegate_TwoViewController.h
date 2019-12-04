//
//  Delegate_TwoViewController.h
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RootTwoViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Delegate_TwoViewControllerDelegate <NSObject>

- (void)delegate_TwoVcTest;

@end

@interface Delegate_TwoViewController : RootTwoViewController

/** 代理 */
@property(nonatomic, weak) id<Delegate_TwoViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
