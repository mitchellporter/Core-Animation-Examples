//
//  VBFBezierLine.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/26/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

// Source: http://www.migueldiazrubio.com/2013/10/28/desarrollo-ios-7-profundizando-en-core-animation-cakeyframeanimation-y-uibezierpathanimation/

#import "VBFBezierLine.h"

@interface VBFBezierLine ()

@property (nonatomic, strong) CAShapeLayer *verticalLine;

@end

@implementation VBFBezierLine

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    [self addPanGesture];
    [self createLine];
}

- (void)createLine
{
    self.verticalLine = [CAShapeLayer layer];
    self.verticalLine.strokeColor = [[UIColor whiteColor] CGColor];
    self.verticalLine.lineWidth = 3.0;
    self.verticalLine.path = [self getLinePathWithAmount:0.0];
    self.verticalLine.fillColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:self.verticalLine];
}

- (CGPathRef)getLinePathWithAmount:(CGFloat)amount
{
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(-1, amount);
    CGPoint midControlPoint = CGPointMake(amount, self.bounds.size.height/2);
    CGPoint bottomPoint = CGPointMake(-1, self.bounds.size.height - amount);
    
    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    return [verticalLine CGPath];
}

- (void)addPanGesture
{
    UIPanGestureRecognizer *sgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlide:)];
    [self addGestureRecognizer:sgr];
}

- (void)handleSlide:(UIPanGestureRecognizer *)gr
{
    CGFloat amountX = [gr translationInView:self].x;
    if (amountX > 0) {
    if (amountX < 170.0) {
        self.verticalLine.path = [self getLinePathWithAmount:amountX];
        
        if (gr.state == UIGestureRecognizerStateEnded) {
            [self animateLineReturnFrom:amountX];
        }
        
    } else {
        [self removeGestureRecognizer:gr];
        [self animateLineReturnFrom:amountX];
    }
 }
}
 
- (void)animateLineReturnFrom:(CGFloat)positionX
{
    // Animation with bounce
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    NSArray *values = @[(id) [self getLinePathWithAmount:positionX],(id) [self getLinePathWithAmount:-(positionX * 0.9)],(id) [self getLinePathWithAmount:(positionX * 0.6)],(id) [self getLinePathWithAmount:-(positionX * 0.4)],(id) [self getLinePathWithAmount:(positionX * 0.25)],(id) [self getLinePathWithAmount:0.0]];
    
    morph.values = values;
    morph.duration = 0.6;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [self.verticalLine addAnimation:morph forKey:@"return"];
}
    
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.verticalLine animationForKey:@"return"]) {
        self.verticalLine.path = [self getLinePathWithAmount:0.0];
        [self.verticalLine removeAllAnimations];
        [self addPanGesture];
    }
}












@end
