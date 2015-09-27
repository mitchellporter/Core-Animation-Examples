//
//  MPWelcomeModal.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/26/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPWelcomeModal.h"

@implementation MPWelcomeModal

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Setup
        [self setup];
    }
    return self;
}

- (void)setup
{
    
}

- (void)display
{
    //1 - Translation
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translation.toValue = @(-470);
    
    //2 - Scale
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(0.0);
    scale.toValue = @(1.0);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[translation, scale];
    group.duration = 0.5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:group forKey:@"basicGroupDisplay"];
}

- (void)displayKeyFrame
{
    NSArray *times = @[@(0.0), @(0.5), @(1)];
    
    //1 - Translation
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    translation.values = @[@(-100), @(-270), @(-470)];
    translation.keyTimes = times;
    translation.calculationMode = kCAAnimationCubicPaced;
    
    CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scale.values = @[@(0.0), @(0.5), @(1.0)];
    scale.keyTimes = times;
    scale.calculationMode = kCAAnimationCubicPaced;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[scale, translation];
    group.duration = 1.0;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    
    
    [self.layer addAnimation:group forKey:@"keyFrameGroupDisplay"];
}

- (void)dismiss
{
    //1 - Translation
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translation.toValue = @(470);
    
    //2 - Scale
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(1.0);
    scale.toValue = @(0.3);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[translation, scale];
    group.duration = 0.5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    //    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:group forKey:@"basicGroupDismiss"];
}

@end
