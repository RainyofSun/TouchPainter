//
//  MessageBridge.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageBridge : NSObject

/// VC 跳转之间跳转传值
+ (UIViewController *)sendMsg:(id)msg willShowViewController:(id)viewController;

@end

NS_ASSUME_NONNULL_END
