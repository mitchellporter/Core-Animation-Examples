//
//  MPAnimationExamplesController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPAnimationExamplesController.h"
#import "MPAnimationsManager.h"
#import "MPAnimationCell.h"
#import "MPPulseButtonController.h"
#import "MPKeyFrameAnimationVictorBaroController.h"
#import "MPLineBounceVictorBaroController.h"
#import "MPModalDisplayController.h"

@interface MPAnimationExamplesController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property MPAnimationsManager *animationsManager;

@end

@implementation MPAnimationExamplesController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup table view
    [self.tableView registerNib:[UINib nibWithNibName:@"MPAnimationCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    // Create datasource
    self.animationsManager = [[MPAnimationsManager alloc] init];
    
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationsManager.animationControllerClasses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MPAnimationCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.label.text = self.animationsManager.animationControllerClasses[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectdAnimation = self.animationsManager.animationControllerClasses[indexPath.row];
    
    if ([selectdAnimation isEqualToString:@"PulseButton1"]) {
        
        // Push pulse button controller
        MPPulseButtonController *controller = [[MPPulseButtonController alloc] initWithNibName:@"MPPulseButtonController" bundle:nil];
        [self.navigationController pushViewController:controller animated:YES];
        
    } else if ([selectdAnimation isEqualToString:@"CAKeyFrameVictorBaro"]) {
        // Push keyframe victor baro controller
        MPKeyFrameAnimationVictorBaroController *controller = [[MPKeyFrameAnimationVictorBaroController alloc] initWithNibName:@"MPKeyFrameAnimationVictorBaroController" bundle:nil];
        [self.navigationController pushViewController:controller animated:YES];
    } else if ([selectdAnimation isEqualToString:@"LineBounceVictorBaro"]) {
        // Push line bounce victor baro controller
        MPLineBounceVictorBaroController *controller = [[MPLineBounceVictorBaroController alloc] initWithNibName:@"MPLineBounceVictorBaroController" bundle:nil];
        [self.navigationController pushViewController:controller animated:YES];
    } else if ([selectdAnimation isEqualToString:@"WelcomeModalMitchellPorter"]) {
        // Push line bounce victor baro controller
        MPModalDisplayController *controller = [[MPModalDisplayController alloc] initWithNibName:@"MPModalDisplayController" bundle:nil];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
