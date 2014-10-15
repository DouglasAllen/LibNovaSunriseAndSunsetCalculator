//
//  SunriseCitiesTableView.m
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/11/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import "SunriseCitiesTableView.h"
#import "SunriseDetailViewController.h"

@interface SunriseCitiesTableView()

@end

@implementation SunriseCitiesTableView

@synthesize cities;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cities = [[SunriseDB database] fetchCities];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"state" ascending:YES];
    self.cities =[self.cities sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.cities = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    City *thisCity = [self.cities objectAtIndex: indexPath.row];
    cell.textLabel.text = thisCity.name;
    cell.detailTextLabel.text = thisCity.state;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailSegue"]){
        SunriseDetailViewController* detailVC = segue.destinationViewController;
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        detailVC.city = [self.cities objectAtIndex:selectedRowIndex.row];
    }
    
}

@end
