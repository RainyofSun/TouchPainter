//
//  MarkRenderer.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "MarkRenderer.h"

@interface MarkRenderer ()

/** shouldMoveContextToDot */
@property (nonatomic,assign) BOOL shouldMoveContextToDot;
/** context */
@property (nonatomic,assign) CGContextRef context;

@end

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        self.context = context;
        self.shouldMoveContextToDot = YES;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)visitMark:(id<Mark>)mark {
    
}

- (void)visitDot:(Dot *)dot {
    CGFloat X = [dot location].x;
    CGFloat Y = [dot location].y;
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(X - frameSize/2.0, Y - frameSize/2.0, frameSize, frameSize);
    CGContextSetFillColorWithColor(self.context, [dot color].CGColor);
    CGContextFillEllipseInRect(self.context, frame);
}

- (void)visitVertex:(Vertex *)vertex {
    CGFloat X = [vertex location].x;
    CGFloat Y = [vertex location].y;
    if (self.shouldMoveContextToDot) {
        CGContextSetFillColorWithColor(self.context, [vertex color].CGColor);
        self.shouldMoveContextToDot = NO;
    } else {
        CGContextAddLineToPoint(self.context, X, Y);
    }
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextSetStrokeColorWithColor(self.context, [stroke color].CGColor);
    CGContextSetLineWidth(self.context, [stroke size]);
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextStrokePath(self.context);
    self.shouldMoveContextToDot = YES;
}

@end
