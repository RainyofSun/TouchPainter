//
//  NSMutableArray+Stack.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)

- (void)push:(id)object;
- (id)pop;
- (void)dropBottom;

@end

NS_ASSUME_NONNULL_END
