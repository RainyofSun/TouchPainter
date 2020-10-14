//
//  Dot.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/25.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Dot.h"

@implementation Dot

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitDot:self];
}

- (void)dealloc {
    NSLog(@"DELLOC : %@",NSStringFromClass(self.class));
}

#pragma mark - copy methods
- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    [dotCopy setColor:[UIColor colorWithCGColor:self.color.CGColor]];
    [dotCopy setSize:self.size];
    return dotCopy;
}

#pragma mark - NSCoder methods
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.color = [coder decodeObjectForKey:@"DotColor"];
        self.size = [coder decodeFloatForKey:@"DotSize"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:self.color forKey:@"DotColor"];
    [coder encodeFloat:self.size forKey:@"DotSize"];
}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat X = self.location.x;
    CGFloat Y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(X - frameSize/2.0, Y - frameSize/2.0, frameSize, frameSize);
    
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillEllipseInRect(context, frame);
}

@end
