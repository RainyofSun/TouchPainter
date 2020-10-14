//
//  CanvasViewController.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/23.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController

/** scribble */
@property (nonatomic,strong) Scribble *scribble;
/** strokeSize */
@property (nonatomic, assign) CGFloat strokeSize;
/** strokeColor */
@property (nonatomic,strong) UIColor *strokeColor;

@end

NS_ASSUME_NONNULL_END
