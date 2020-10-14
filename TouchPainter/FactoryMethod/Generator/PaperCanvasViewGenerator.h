//
//  PaperCanvasViewGenerator.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "PaperCanvasView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaperCanvasViewGenerator : CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
