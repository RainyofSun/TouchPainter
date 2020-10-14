//
//  Mark.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  组合模式 抽象类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Mark <NSObject,NSCopying,NSCoding>

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

- (id)copy;
- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger)index;

// 访问者模式
- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;
// 枚举模式
- (NSEnumerator *)enumerator;
// 枚举块模式-->内部枚举
- (void)enumerateMarksUsingBlock:(void(^)(id <Mark> item, BOOL *stop))block;

- (void)drawWithContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
