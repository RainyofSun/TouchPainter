//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Command.h"
#import "ScribbleSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenScribbleCommand : Command

/** scribbleSource */
@property (nonatomic,weak) id<ScribbleSource> scribbleSource;

- (id)initWithScribbleSource:(id <ScribbleSource>)aScribbleSource;
- (void)execute;

@end

NS_ASSUME_NONNULL_END
