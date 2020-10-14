//
//  ScribbleThumnailViewImageProxy.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleThumnailViewImageProxy.h"

@interface ScribbleThumnailViewImageProxy ()

/** scribble */
@property (nonatomic,strong) Scribble *scribble_;
/** realImage */
@property (nonatomic,strong) UIImage *realImage;
/** loadingThreadHasLanched */
@property (nonatomic,assign) BOOL loadingThreadHasLanched;

@end

@implementation ScribbleThumnailViewImageProxy

- (void)drawRect:(CGRect)rect {
    if (self.realImage == nil) {
        // 绘制虚线占位图
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 10.0);
        const CGFloat dashLength[2] = {10,3};
        CGContextSetLineDash(context, 3, dashLength, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
        CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        // 如果没有加载到实际内容，就启动一个线程进行加载
        if (!self.loadingThreadHasLanched) {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread) withObject:nil];
            self.loadingThreadHasLanched = YES;
        }
    } else {
        [self.realImage drawInRect:rect];
    }
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - Touch methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.touchCommand execute];
}

#pragma mark - Private methods
- (void)forwardImageLoadingThread {
    @autoreleasepool {
        [self image];
        [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
    }
}

#pragma mark - lazy
- (Scribble *)scribble_ {
    if (!_scribble_) {
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:[[NSFileManager defaultManager] contentsAtPath:self.scribblePath]];
        _scribble_ = [Scribble scribbleWithMemento:scribbleMemento];
    }
    return _scribble_;
}

- (UIImage *)image {
    if (!_realImage) {
        _realImage = [[UIImage alloc] initWithContentsOfFile:self.imagePath];
    }
    return _realImage;
}

@end
