//
//  OpenScribbleCommand.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "OpenScribbleCommand.h"

@implementation OpenScribbleCommand

- (id)initWithScribbleSource:(id<ScribbleSource>)aScribbleSource {
    if (self = [super init]) {
        self.scribbleSource = aScribbleSource;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)execute {
    [[CoordinatingController sharedInstance].canvasViewController setScribble:[self.scribbleSource scribble]];
    ((void (*)(id, SEL,id))objc_msgSend)((id)[CoordinatingController sharedInstance], @selector(requestViewChangeByObject:),self);
}

@end
