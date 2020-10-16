//
//  SetStrokeSizeCommand.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "SetStrokeSizeCommand.h"

@implementation SetStrokeSizeCommand

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)execute {
    CGFloat strokeSize = 1;
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(command:didRequestForStrokeSize:)]) {
        [self.delegate command:self didRequestForStrokeSize:&strokeSize];
    }
    
    [[CoordinatingController sharedInstance].canvasViewController setStrokeSize:strokeSize];
}

@end
