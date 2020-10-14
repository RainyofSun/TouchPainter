//
//  Command.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Command : NSObject

/** userInfo */
@property (nonatomic,strong) NSDictionary *userInfo;

- (void)execute;
- (void)undo;

@end

NS_ASSUME_NONNULL_END
