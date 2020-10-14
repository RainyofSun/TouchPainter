//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/22.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CoordinatingController.h"

static CoordinatingController *controller = nil;

@implementation CoordinatingController

@synthesize canvasViewController = canvasViewController_;
@synthesize activeViewController = activeViewController_;

#pragma make - life Circle
+ (CoordinatingController *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (controller == nil) {
            controller = [[CoordinatingController alloc] init];
        }
    });
    return controller;
}

- (instancetype)init {
    if (self = [super init]) {
        canvasViewController_ = [[CanvasViewController alloc] init];
        activeViewController_ = canvasViewController_;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - 消息透传
- (void)requestViewChangeByObject:(id)object {
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)object tag]) {
            case kButtonTagDone:
                [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
                activeViewController_ = canvasViewController_;
                break;
            case kButtonTagOpenPalatteView:
                [self presentVC:@"PaletterViewController"];
                break;
            case kButtonTagOpenThumbnailView:
                [self presentVC:@"ThumbnailViewController"];
                break;
            default:
                break;
        }
    } else {
        [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
        activeViewController_ = canvasViewController_;
    }
}

#pragma mark - private methods
- (void)presentVC:(NSString *)vcName {
    UIViewController * presentVC = [[NSClassFromString(vcName) alloc] init];
    [canvasViewController_ presentViewController:presentVC animated:YES completion:nil];
    activeViewController_ = presentVC;
}

@end
