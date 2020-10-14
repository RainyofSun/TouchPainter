//
//  MessageBridge.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "MessageBridge.h"

@implementation MessageBridge

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - public methods
+ (UIViewController *)sendMsg:(id)msg willShowViewController:(id)viewController {
    if ([viewController isKindOfClass:[NSString class]]) {
        Class vc = NSClassFromString(viewController);
        UIViewController *obj = [[vc alloc] init];
        ((void (*)(id,SEL,id))objc_msgSend)(obj,@selector(modulesSendMsg:),msg);
        return obj;
    } else if ([viewController isKindOfClass:[UIViewController class]]) {
        UIViewController *showVC = (UIViewController *)viewController;
        ((void (*)(id,SEL,id))objc_msgSend)(showVC,@selector(modulesSendMsg:),msg);
        return showVC;
    } else {
        UIViewController *obj = [[UIViewController alloc] init];
        obj.view.backgroundColor = [UIColor whiteColor];
        return obj;
    }
}

@end
