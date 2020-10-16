//
//  ScribbleThumbnailTableViewCell.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/10/14.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ScribbleThumbnailTableViewCell.h"

@implementation ScribbleThumbnailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - Public methods
+ (NSInteger)numberOfPlaceHolders {
    return 3;
}

- (void)addThumnailView:(UIView *)thumnailView atIndex:(NSInteger)index {
    if (index == 0) {
        for (UIView *view in [self.contentView subviews]) {
            [view removeFromSuperview];
        }
    }
    
    if (index < [ScribbleThumbnailTableViewCell numberOfPlaceHolders]) {
        CGFloat x = index * 90 + (index + 1) * 12;
        CGFloat y = 10;
        CGFloat width = 90;
        CGFloat height = 130;
        
        [thumnailView setFrame:CGRectMake(x, y, width, height)];
        
        [self.contentView addSubview:thumnailView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
