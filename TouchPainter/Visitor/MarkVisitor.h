//
//  MarkVisitor.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  访问者模式 抽象类

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;
@class Vertex,Dot,Stroke;

@protocol MarkVisitor <NSObject>

- (void) visitMark:(id <Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
- (void) visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
