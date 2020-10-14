//
//  ScribbleThumnailView.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "ScribbleSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumnailView : UIView<ScribbleSource>

/** image */
@property (nonatomic,readonly) UIImage *image;
/** scribble */
@property (nonatomic,readonly) Scribble *scribble;
/** imagePath */
@property (nonatomic,copy) NSString *imagePath;
/** scribblePath */
@property (nonatomic,copy) NSString *scribblePath;


@end

NS_ASSUME_NONNULL_END
