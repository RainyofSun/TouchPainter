//
//  MarkEnumerator+Internal.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  枚举模式 抽象类

#import "MarkEnumerator.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Mark;

@interface MarkEnumerator ()

- (id)initWithMark:(id <Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id <Mark>)mark;

@end

NS_ASSUME_NONNULL_END
