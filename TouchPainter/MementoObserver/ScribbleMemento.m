//
//  ScribbleMemento.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@interface ScribbleMemento ()
{
    id <Mark> mark;
}

@end

@implementation ScribbleMemento
@synthesize mark = mark_;

- (id)initWithMark:(id<Mark>)aMark {
    if (self = [super init]) {
        mark = aMark;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data {
    id <Mark> retoreMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:retoreMark];
    return memento;
}

- (NSData *)data {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mark];
    return data;
}

@end
