//
//  Dot.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  组合模式

#import "Vertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dot : Vertex

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

- (id)copyWithZone:(NSZone *)zone;

- (instancetype)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
