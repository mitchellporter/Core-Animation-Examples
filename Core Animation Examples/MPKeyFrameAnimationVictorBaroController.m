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

- (IBAction)show:(id)sender
{
    
}

- (IBAction)hide:(id)sender
{
    
}

- (IBAction)pop:(id)sender
{
    
}

- (IBAction)path:(id)sender
{
    
}

@end
