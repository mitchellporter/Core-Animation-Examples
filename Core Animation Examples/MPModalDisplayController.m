//
//  MPModalDisplayController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/26/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPModalDisplayController.h"
#import "MPWelcomeModal.h"

@interface MPModalDisplayController ()

@property (nonatomic, retain) IBOutlet MPWelcomeModal *welcomeModal;

@end

@implementation MPModalDisplayController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.welcomeModal.center = CGPointMake(self.view.center.x, self.welcomeModal.center.y);
}

- (IBAction)showWelcomeModal:(id)sender
{
    [self.welcomeModal display];
}

- (IBAction)dismissWelcomeModal:(id)sender
{
    [self.welcomeModal dismiss];
}

@end
