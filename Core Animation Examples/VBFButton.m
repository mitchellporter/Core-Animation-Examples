//
//  VBFButton.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "VBFButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation VBFButton

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame internalColor:[UIColor blackColor] externalColor:[UIColor blackColor]];
}

- (id)initWithFrame:(CGRect)frame internalColor:(UIColor *)internalColor externalColor:(UIColor *)externalColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.internalColor = internalColor;
        self.externalColor = externalColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //1
    self.internalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, 15, 15)];
    [self.internalColor setFill];
    [self.internalCircle fill];
    
    //2
    self.externalCircle = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, 8, 8)];
    [self.externalColor setStroke];
    self.externalCircle.lineWidth = 4.0;
    [self.externalCircle stroke];
    
    //3
    if (!self.waveCircle) {
        [self addWaveLayer];
    }
}

@end
