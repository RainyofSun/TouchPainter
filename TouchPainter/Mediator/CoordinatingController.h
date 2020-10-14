//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/22.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  中介者模式

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    kButtonTagDone,
    kButtonTagOpenPalatteView,
    kButtonTagOpenThumbnailView,
} ButtonTag;

@interface CoordinatingController : NSObject

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
