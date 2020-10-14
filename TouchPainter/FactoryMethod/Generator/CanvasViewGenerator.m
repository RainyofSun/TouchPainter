//
//  CanvasViewGenerator.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CanvasViewGenerator.h"

@implementation CanvasViewGenerator

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - public methods
- (CanvasView *)canvasViewWithFrame:(CGRect)frame {
    return [[CanvasView alloc] initWithFrame:frame];
}

@end
