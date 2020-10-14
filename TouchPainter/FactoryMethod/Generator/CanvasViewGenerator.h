//
//  CanvasViewGenerator.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  工厂模式 工厂 抽象类

#import <Foundation/Foundation.h>
#import "CanvasView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
