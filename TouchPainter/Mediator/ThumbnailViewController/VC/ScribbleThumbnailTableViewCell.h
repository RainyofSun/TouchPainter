//
//  ScribbleThumbnailTableViewCell.h
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/10/14.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailTableViewCell : UITableViewCell

+ (NSInteger)numberOfPlaceHolders;
- (void)addThumnailView:(UIView *)thumnailView atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
