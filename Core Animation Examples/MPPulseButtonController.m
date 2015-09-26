//
//  MPPulseButtonController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

// Source: http://www.migueldiazrubio.com/2013/08/02/desarrollo-ios-creando-nuestros-propios-controles-con-core-animation/

#import "MPPulseButtonController.h"
#import "VBFButton.h"

@interface MPPulseButtonController ()

@property (nonatomic, retain) IBOutlet VBFButton *waveButton;

@end

@implementation MPPulseButtonController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup the button
    self.waveButton.backgroundColor = [UIColor clearColor];
    self.waveButton.internalColor = [UIColor whiteColor];
    self.waveButton.externalColor = [UIColor whiteColor];
    self.waveButton.alpha = 0.85;
}


@end
