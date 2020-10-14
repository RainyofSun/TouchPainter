//
//  Stroke.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Internal.h"

@interface Stroke ()

/** children */
@property (nonatomic,strong) NSMutableArray *children;

@end

@implementation Stroke

- (instancetype)init {
    if (self = [super init]) {
        self.children = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)setLocation:(CGPoint)location {
    
}

- (CGPoint)location {
    if (self.children.count > 0) {
        return [(id <Mark>)[self.children objectAtIndex:0] location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    } else {
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index > self.children.count) {
        return nil;
    }
    return [self.children objectAtIndex:index];
}

- (id<Mark>)lastChild {
    return self.children.lastObject;
}

- (NSUInteger)count {
    return self.children.count;
}

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    for (id <Mark> dot in self.children) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}

#pragma mark - Copying methods
- (id)copyWithZone:(NSZone *)zone {
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:self.color.CGColor]];
    [strokeCopy setSize:self.size];
    
    for (id <Mark> child in self.children) {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    
    return strokeCopy;
}

#pragma mark - NSCoder methods
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.color = [coder decodeObjectForKey:@"StrokeColor"];
        self.size = [coder decodeFloatForKey:@"StrokeSize"];
        self.children = [coder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.color forKey:@"StrokeColor"];
    [coder encodeFloat:self.size forKey:@"StrokeSize"];
    [coder encodeObject:self.children forKey:@"StrokeChildren"];
}

#pragma mark - Enumerator methods
- (NSEnumerator *)enumerator {
    return [[MarkEnumerator alloc] initWithMark:self];
}

- (void)enumerateMarksUsingBlock:(void (^)(id<Mark> _Nonnull, BOOL * _Nonnull))block {
    BOOL stop = NO;
    NSEnumerator *enumerator = [self enumerator];
    for (id <Mark> mark in enumerator) {
        block(mark,&stop);
        if (stop) {
            break;
        }
    }
}

#pragma mark - Draw
- (void)drawWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for (id <Mark> mark in self.children) {
        [mark drawWithContext:context];
    }
    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextStrokePath(context);
}

@end
