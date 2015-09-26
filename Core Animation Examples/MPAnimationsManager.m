//
//  MPAnimationsManager.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPAnimationsManager.h"
#import "MPAnimationExamplesController.h"

@interface MPAnimationsManager ()

@property (nonatomic, readwrite) NSMutableArray *animationControllerClasses;

@end

@implementation MPAnimationsManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // Setup
        [self setup];
    }
    return self;
}

- (void)setup
{
    // Setup the animation controller classes array
    self.animationControllerClasses = [[NSMutableArray alloc] initWithArray:@[@"PulseButton1",
                                                                              @"CAKeyFrameVictorBaro"
                                                                              ]];
}


@end
