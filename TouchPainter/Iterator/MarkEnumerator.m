//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator+Internal.h"

@interface MarkEnumerator ()

/** stack */
@property (nonatomic,strong) NSMutableArray *stack;

@end

@implementation MarkEnumerator

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (NSArray *)allObjects {
    return [[self.stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject {
    return [self.stack pop];
}

#pragma mark - private methods
- (id)initWithMark:(id<Mark>)mark {
    if (self = [super init]) {
        self.stack = [NSMutableArray arrayWithCapacity:[mark count]];
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark {
    if (mark == nil) {
        return;
    }
    [self.stack push:mark];
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while ((childMark = [mark childMarkAtIndex:--index])) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
