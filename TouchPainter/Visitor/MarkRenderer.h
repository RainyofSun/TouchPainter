//
//  MarkRenderer.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  访问者模式

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject<MarkVisitor>

- (id)initWithCGContext:(CGContextRef)context;

// override
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitMark:(id<Mark>)mark;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
