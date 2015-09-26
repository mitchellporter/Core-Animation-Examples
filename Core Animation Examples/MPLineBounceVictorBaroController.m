//
//  MPLineBounceVictorBaroController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/26/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.

// Source: http://www.migueldiazrubio.com/2013/10/28/desarrollo-ios-7-profundizando-en-core-animation-cakeyframeanimation-y-uibezierpathanimation/


#import "MPLineBounceVictorBaroController.h"
#import "VBFBezierLine.h"

@interface MPLineBounceVictorBaroController ()

@property (nonatomic, retain) IBOutlet VBFBezierLine *lineView;

@end

@implementation MPLineBounceVictorBaroController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Disable nav swipe
    [self disableNavSwipeBack];
    
}

- (void)disableNavSwipeBack
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}


@end
