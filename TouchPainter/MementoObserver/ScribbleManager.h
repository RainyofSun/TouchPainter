//
//  ScribbleManager.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/27.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleManager : NSObject

- (void)saveScribble:(Scribble *)scribble thumnail:(UIImage *)image;
- (NSInteger)numberOfScribbles;
- (Scribble *)scribbleAtIndex:(NSInteger)index;
- (UIView *)scribbleThumbailViewAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
