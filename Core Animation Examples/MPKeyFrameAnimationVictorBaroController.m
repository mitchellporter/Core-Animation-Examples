//
//  MPKeyFrameAnimationVictorBaroController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

// Source: http://www.migueldiazrubio.com/2013/10/28/desarrollo-ios-7-profundizando-en-core-animation-cakeyframeanimation-y-uibezierpathanimation/

#import "MPKeyFrameAnimationVictorBaroController.h"

@interface MPKeyFrameAnimationVictorBaroController ()

@property (nonatomic, retain) IBOutlet UIImageView *imageView1;
@property (nonatomic, retain) IBOutlet UIImageView *imageView2;

@end

@implementation MPKeyFrameAnimationVictorBaroController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addEntranceAnimationToLayer:self.imageView1.layer withDelay:0.5];
    [self addEntranceAnimationToLayer:self.imageView2.layer withDelay:0.8];
    
}

- (void)addEntranceAnimationToLayer:(CALayer *)aLayer withDelay:(CGFloat)aDelay
{
    CAKeyframeAnimation *trans = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    NSArray *values = @[@(-300), @(40), @(0)];
    trans.values = values;
    
    NSArray *times = @[@(0.0), @(0.85), @(1)];
    trans.keyTimes = times;
    trans.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    trans.duration = 0.8;
    trans.removedOnCompletion = NO;
    trans.fillMode = kCAFillModeBackwards;
    trans.beginTime = CACurrentMediaTime() + aDelay;
    [aLayer addAnimation:trans forKey:@"entrance"];
}

- (void)addHideAnimationToLayer:(CALayer *)aLayer withDelay:(CGFloat)aDelay
{
    // Translation Animation
    CAKeyframeAnimation *trans = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    
    NSArray *transValues = @[@(0), @(2), @(-50), @(0)];
    trans.values = transValues;
    NSArray *times = @[@(0.0), @(0.1), @(0.8), @(1)];
    trans.keyTimes = times;
    
    // Opacity Animation
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    
    NSArray *opValues = @[@(1.0), @(1.0), @(0.6), @(0.0)];
    opacity.values = opValues;
    opacity.keyTimes = times;
    
    // Group Animations
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[trans, opacity];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.duration = 0.6;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.beginTime = CACurrentMediaTime() + aDelay;
    
    [aLayer addAnimation:group forKey:@"hide"];
}


- (void)addPopAnimationToLayer:(CALayer *)aLayer withBounce:(CGFloat)bounce damp:(CGFloat)damp
{
    // TESTIED WITH BOUNCE 0.2, DAMP = 0.055
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 1;
    
    int steps = 100;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    double value = 0;
    float e = 2.71;
    
    for (int t = 0; t < 100; t++) {
        value = pow(e, -damp*t) * sin(bounce*t) + 1;
        [values addObject:[NSNumber numberWithFloat:value]];
    }
    animation.values = values;
    [aLayer addAnimation:animation forKey:@"appear"];
}

- (IBAction)show:(id)sender
{
    
}

- (IBAction)hide:(id)sender
{
    [self addHideAnimationToLayer:self.imageView1.layer withDelay:0.5];
    [self addHideAnimationToLayer:self.imageView2.layer withDelay:0.8];
}

- (IBAction)pop:(id)sender
{
    [self addPopAnimationToLayer:self.imageView1.layer withBounce:0.2 damp:0.055];
    [self addPopAnimationToLayer:self.imageView2.layer withBounce:0.2 damp:0.055];
}

- (IBAction)path:(id)sender
{
    
}

@end
