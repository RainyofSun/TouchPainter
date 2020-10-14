//
//  ClothCanvasViewGenerator.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"

@implementation ClothCanvasViewGenerator

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - override
- (CanvasView *)canvasViewWithFrame:(CGRect)frame {
    return [[ClothCnavasView alloc] initWithFrame:frame];
}

@end
