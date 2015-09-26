//
//  VBFButton.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "VBFButton.h"
#import <QuartzCore/QuartzCore.h>

@interface VBFButton ()

@property CAShapeLayer *waveCircle;

@end

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

- (void)addWaveLayer
{
    self.waveCircle = [CAShapeLayer layer];
    self.waveCircle.frame = self.bounds;
    self.waveCircle.path = self.externalCircle.CGPath;
    self.waveCircle.strokeColor = self.externalColor.CGColor;
    self.waveCircle.lineWidth = 3.0f;
    self.waveCircle.fillColor = [UIColor clearColor].CGColor;
    
    [self.layer addSublayer:self.waveCircle];
}

- (void)animateWave
{
    //1
    CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeOutAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    fadeOutAnimation.toValue = [NSNumber numberWithFloat:0.0f];
    
    //2
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = [NSNumber numberWithFloat:1.0f];
    scale.toValue = [NSNumber numberWithFloat:1.6f];
    
    //3
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[fadeOutAnimation, scale];
    group.duration = 0.5;
    
    [self.waveCircle addAnimation:group forKey:@"trans+opacityAnimation"];
}















@end
