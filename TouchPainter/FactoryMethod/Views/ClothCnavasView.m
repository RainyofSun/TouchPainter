//
//  ClothCnavasView.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/24.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "ClothCnavasView.h"

@implementation ClothCnavasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *backgroudImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloth"]];
        [self addSubview:backgroudImgView];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

@end
