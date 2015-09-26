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
//    CAKeyframeAnimation *displayAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
//    displayAnimation.values = @[@(-500), @(500), @(-500), @(500), @(-500)];
//    displayAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    displayAnimation.duration = 3.0;
//    displayAnimation.fillMode = kCAFillModeForwards;
//    displayAnimation.removedOnCompletion = NO;
//    
//    [self.layer addAnimation:displayAnimation forKey:@"displayWelcomeModal"];
    
    
    //1 - Translation
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translation.toValue = @(-470);
    
    //2 - Scale
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(0.3);
    scale.toValue = @(1.0);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[translation, scale];
    group.duration = 0.5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
//    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:group forKey:@"group"];
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
    
    [self.layer addAnimation:group forKey:@"group2"];
}

@end
