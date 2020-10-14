//
//  CanvasView.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  工厂模式 产品 抽象类

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;

@interface CanvasView : UIView

/** mark */
@property (nonatomic,weak) id<Mark> mark;

@end

NS_ASSUME_NONNULL_END
