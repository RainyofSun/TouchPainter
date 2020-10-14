//
//  SetStrokeSizeCommand.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@class SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate <NSObject>

- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat)size;

@end

@interface SetStrokeSizeCommand : Command

/** delegate */
@property (nonatomic,weak) id<SetStrokeSizeCommandDelegate> delegate;

- (void)execute;

@end

NS_ASSUME_NONNULL_END
