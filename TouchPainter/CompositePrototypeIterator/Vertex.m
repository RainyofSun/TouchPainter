//
//  Vertex.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

- (id)initWithLocation:(CGPoint)location {
    if (self = [super init]) {
        self.location = location;
        self.size = 0;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

// Make opertions do nothing
- (void)addMark:(id<Mark>)mark {
    
}

- (void)removeMark:(id<Mark>)mark {
    
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    return nil;
}

- (id<Mark>)lastChild {
    return nil;
}

- (NSUInteger)count {
    return 0;
}

- (NSEnumerator *)enumerator {
    return nil;
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitVertex:self];
}

#pragma mark - Copying methods
- (id)copyWithZone:(NSZone *)zone {
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    return vertexCopy;
}

#pragma mark - coder methods
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.location = [(NSValue *)[coder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:[NSValue valueWithCGPoint:self.location] forKey:@"VertexLocation"];
}

#pragma mark - MarkIterator methods
- (void)enumerateMarksUsingBlock:(void (^)(id<Mark> _Nonnull, BOOL * _Nonnull))block {
    
}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat X = self.location.x;
    CGFloat Y = self.location.y;
    
    CGContextAddLineToPoint(context, X, Y);
}

@end
