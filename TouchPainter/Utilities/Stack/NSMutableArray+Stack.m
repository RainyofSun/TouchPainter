//
//  NSMutableArray+Stack.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    if (object != nil) {
        [self addObject:object];
    }
}

- (id)pop {
    if (self.count == 0) {
        return nil;
    }
    id object = [self lastObject];
    [self removeLastObject];
    return object;
}

- (void)dropBottom {
    if (self.count == 0) {
        return;
    }
    [self removeObjectAtIndex:0];
}

@end
