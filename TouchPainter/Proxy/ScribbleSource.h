//
//  ScribbleSource.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  代理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Scribble;

@protocol ScribbleSource <NSObject>

- (Scribble *)scribble;

@end

NS_ASSUME_NONNULL_END
