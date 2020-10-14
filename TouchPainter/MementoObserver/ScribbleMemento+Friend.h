//
//  ScribbleMemento+Friend.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento ()

- (id) initWithMark:(id <Mark>)aMark;

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot; // 保存Mark的引用是一个完整的快照还是片段

@end

NS_ASSUME_NONNULL_END
