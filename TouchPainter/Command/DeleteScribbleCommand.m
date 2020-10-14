//
//  DeleteScribbleCommand.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "DeleteScribbleCommand.h"

@implementation DeleteScribbleCommand

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

- (void)execute {
    ((void (*)(id, SEL))objc_msgSend)((id)[CoordinatingController sharedInstance].canvasViewController, @selector(deleteScribble));
}

@end
