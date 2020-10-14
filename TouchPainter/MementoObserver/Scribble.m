//
//  Scribble.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/27.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Scribble.h"
#import "ScribbleMemento+Friend.h"
#import "Stroke.h"

@interface Scribble ()
{
    id <Mark> parentMark;
    id <Mark> incrementalMark;
}

@property (nonatomic, retain) id <Mark> mark;

@end

@implementation Scribble

@synthesize mark=parentMark;

- (instancetype)init {
    if (self = [super init]) {
        parentMark = [[Stroke alloc] init];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - Methods for Mark management
- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)showAddToPreviousMark {
    // 手动触发KVO
    [self willChangeValueForKey:@"mark"];
    
    if (showAddToPreviousMark) {
        [[parentMark lastChild] addMark:aMark];
    } else {
        [parentMark addMark:aMark];
        incrementalMark = aMark;
    }
    
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)mark {
    if (mark == parentMark) {
        return;
    }
    
    // 手动触发KVO
    [self willChangeValueForKey:@"mark"];
    
    [parentMark removeMark:mark];
    if (mark == incrementalMark) {
        incrementalMark = nil;
    }
    
    [self didChangeValueForKey:@"mark"];
}

#pragma mark - Methods for memento
- (id)initWithMemento:(ScribbleMemento *)aMemento {
    if (self = [super init]) {
        if ([aMemento hasCompleteSnapshot]) {
            [self setMark:[aMemento mark]];
        } else {
            // 如果备忘录中之包含一个增量的Mark，那就需要创建容纳他的父节点
            parentMark = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    return self;
}

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento {
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    id <Mark> mementoMark = incrementalMark;
    if (hasCompleteSnapshot) {
        // 如果要求返回完整的快照,就将它设置为parentMark
        mementoMark = parentMark;
    } else if (mementoMark == nil) {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshot];
    
    return memento;
}

- (ScribbleMemento *)scribbleMemento {
    return [self scribbleMementoWithCompleteSnapshot:YES];
}

- (void)attachStateFromMemento:(ScribbleMemento *)memento {
    // 把来自备忘录对象的Mark附加到根节点
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}

@end
