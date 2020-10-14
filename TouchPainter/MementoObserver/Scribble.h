//
//  Scribble.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/27.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scribble : NSObject

// for Mark managent
- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)showAddToPreviousMark;
- (void)removeMark:(id <Mark>)mark;

// for memento (备忘录)
- (id)initWithMemento:(ScribbleMemento *)aMemento;
+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento;

- (ScribbleMemento *)scribbleMemento;
- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void)attachStateFromMemento:(ScribbleMemento *)memento;

@end

NS_ASSUME_NONNULL_END
