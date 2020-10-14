//
//  SetStrokeColorCommand.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "SetStrokeColorCommand.h"

@implementation SetStrokeColorCommand

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)execute {
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    
    if (self.colorDelegate != nil && [self.colorDelegate respondsToSelector:@selector(command:didRequestColorComponentsForRed:green:blue:)]) {
        [self.colorDelegate command:self didRequestColorComponentsForRed:red green:green blue:blue];
    }
    
    if (self.RGBValuesProvider) {
        self.RGBValuesProvider(red, green, blue);
    }
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [[CoordinatingController sharedInstance].canvasViewController setStrokeColor:color];
    
    if (self.colorDelegate != nil && [self.colorDelegate respondsToSelector:@selector(command:didFinishColorUpdateWithColor:)]) {
        [self.colorDelegate command:self didFinishColorUpdateWithColor:color];
    }
    
    if (self.postColorUpdateProvider) {
        self.postColorUpdateProvider(color);
    }
}

@end
