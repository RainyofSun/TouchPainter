//
//  Stroke.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  组合模式

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stroke : NSObject<Mark>

/** color */
@property (nonatomic,strong) UIColor *color;
/** size */
@property (nonatomic,assign) CGFloat size;
/** location */
@property (nonatomic,assign) CGPoint location;
/** count */
@property (nonatomic,readonly) NSUInteger count;
/** lastChild */
@property (nonatomic,readonly) id <Mark> lastChild;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger)index;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

- (id)copyWithZone:(NSZone *)zone;

- (NSEnumerator *)enumerator;
- (void)enumerateMarksUsingBlock:(void (^)(id<Mark> _Nonnull, BOOL * _Nonnull))block;

- (instancetype)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
