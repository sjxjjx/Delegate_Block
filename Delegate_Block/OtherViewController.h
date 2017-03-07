//
//  OtherViewController.h
//  Delegate_Block
//
//  Created by sjx on 2017/3/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PopStringBlock)(NSString *popString);

@protocol OtherViewControllerDelegate <NSObject>

- (void)popVCWithString:(NSString *)popString;

@end

@interface OtherViewController : UIViewController

/** 顺传数据 */
@property(nonatomic, copy) NSString *pushString;

/** 代理 */
@property(nonatomic, weak) id<OtherViewControllerDelegate> delegate;
/** Block */
@property(nonatomic, copy) PopStringBlock popBlock;

@end
