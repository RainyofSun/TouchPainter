//
//  CommandBarButton.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandBarButton : UIBarButtonItem

/** command */
@property (nonatomic,strong) Command *command;

@end

NS_ASSUME_NONNULL_END
