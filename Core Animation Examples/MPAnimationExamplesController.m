//
//  MPAnimationExamplesController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPAnimationExamplesController.h"
#import "MPAnimationsManager.h"
#import "MPPulseButtonController.h"
#import "MPAnimationCell.h"

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
        MPPulseButtonController *pulseButtonController = [[MPPulseButtonController alloc] initWithNibName:@"MPPulseButtonController" bundle:nil];
        [self.navigationController pushViewController:pulseButtonController animated:YES];
    }
}

@end
