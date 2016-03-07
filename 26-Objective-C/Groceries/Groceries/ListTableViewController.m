//
//  ListTableViewController.m
//  Groceries
//
//  Created by Ben Gohlke on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "ListTableViewController.h"
#import "GroceryItem.h"

@interface ListTableViewController () {
    NSMutableArray *groceries;
}

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    groceries = [[NSMutableArray alloc] init];
    
    [self loadGroceries];
}

- (void)loadGroceries
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"groceries" ofType:@"json"];
    NSArray *groceriesJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aDictionary in groceriesJSON)
    {
        GroceryItem *anItem = [GroceryItem groceryItemWithDictionary:aDictionary];
        [groceries addObject:anItem];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return groceries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroceryItemCell" forIndexPath:indexPath];
    
    GroceryItem *anItem = [groceries objectAtIndex:indexPath.row];
    cell.textLabel.text = anItem.name;
    cell.detailTextLabel.text = anItem.category;
    
    return cell;
}

@end
