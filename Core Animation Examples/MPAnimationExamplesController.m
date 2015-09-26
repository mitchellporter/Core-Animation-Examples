//
//  MPAnimationExamplesController.m
//  Core Animation Examples
//
//  Created by Mitchell Porter on 9/25/15.
//  Copyright © 2015 Mitchell Porter. All rights reserved.
//

#import "MPAnimationExamplesController.h"

@interface MPAnimationExamplesController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end

@implementation MPAnimationExamplesController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
