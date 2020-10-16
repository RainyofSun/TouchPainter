//
//  SetStrokeColorCommand.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/28.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^RGBValuesProvider)(CGFloat *red,CGFloat *green,CGFloat *blue);
typedef void(^POstColorUpdateProvider)(UIColor *color);

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate <NSObject>

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue;
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color;

@end

@interface SetStrokeColorCommand : Command

/** colorDelegate */
@property (nonatomic,weak) id<SetStrokeColorCommandDelegate> colorDelegate;
/** RGBValuesProvider */
@property (nonatomic,copy) RGBValuesProvider RGBValuesProvider;
/** postColorUpdateProvider */
@property (nonatomic,copy) POstColorUpdateProvider postColorUpdateProvider;

- (void)execute;

@end

NS_ASSUME_NONNULL_END
