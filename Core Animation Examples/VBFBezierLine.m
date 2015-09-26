//
//  VBFBezierLine.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/26/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "VBFBezierLine.h"

@interface VBFBezierLine ()

@property (nonatomic, strong) CAShapeLayer *verticalLine;

@end

@implementation VBFBezierLine

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



@end
