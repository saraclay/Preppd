//
//  ChecklistController.m
//  Preppd
//
//  Created by ITP Student on 2/8/15.
//  Copyright (c) 2015 ITP Student. All rights reserved.
//

#import "ChecklistModel.h"
#import "ChecklistController.h"

@interface ChecklistController ()

@property (strong, nonatomic) ChecklistModel * model;

@end

@implementation ChecklistController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //no shared model, so alloc and init instead
    self.model = [[ChecklistModel alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    
    // Return the number of sections.
    return 1;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if([view isKindOfClass:[UITableViewHeaderFooterView class]]){
        
        UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *) view;
        tableViewHeaderFooterView.textLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.model numberOfAnswers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"IdeasAnswerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistController"];
    
    cell.textLabel.font = [UIFont fontWithName:@"Gill Sans" size:20];
    cell.textLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.model answerAtIndex:indexPath.row];
    if ([self.model isCheckedAtIndex:indexPath.row]) {
        cell.accessoryType  = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.model setCheckmark:NO atIndex:indexPath.row];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.model setCheckmark:YES atIndex:indexPath.row];

    }
}

@end
