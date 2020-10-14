//
//  ScribbleThumnailViewImageProxy.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleThumnailView.h"
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumnailViewImageProxy : ScribbleThumnailView

/** touchCommand */
@property (nonatomic,strong) Command *touchCommand;

@end

NS_ASSUME_NONNULL_END
