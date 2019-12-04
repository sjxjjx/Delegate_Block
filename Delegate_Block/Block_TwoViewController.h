//
//  Block_TwoViewController.h
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RootTwoViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TwoVcBlock)(void);

@interface Block_TwoViewController : RootTwoViewController

/** block */
@property(nonatomic, copy) TwoVcBlock twoVcBlock;

@end

NS_ASSUME_NONNULL_END
