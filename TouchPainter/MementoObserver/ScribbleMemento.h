//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//  备忘录 模式

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento : NSObject

+ (ScribbleMemento *)mementoWithData:(NSData *)data;
- (NSData *)data;

@end

NS_ASSUME_NONNULL_END
