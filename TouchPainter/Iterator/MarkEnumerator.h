//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  枚举模式

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator : NSEnumerator

- (NSArray *)allObjects;
- (id)nextObject;

@end

NS_ASSUME_NONNULL_END
