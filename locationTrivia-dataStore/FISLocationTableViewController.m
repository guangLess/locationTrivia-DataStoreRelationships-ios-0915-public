//
//  FISTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Guang on 10/20/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationTableViewController.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsDataStroe.h"
#import "FISLocation.h"

@interface FISLocationTableViewController ()

@property (strong , nonatomic)FISLocationsDataStroe * store;
@property (strong, nonatomic)NSMutableArray * locationList;


@end

@implementation FISLocationTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    
    self.store =  [FISLocationsDataStroe sharedDataStore]; // this is cool !!! 
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.locations.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.store.locations[indexPath.row] name];
    FISLocation * location = self.store.locations[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",location.trivia.count];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"detail"]) {
    
    FISTriviaTableViewController * tvVC = segue.destinationViewController;
    NSIndexPath * selectIndex = self.tableView.indexPathForSelectedRow;
    FISLocation * location = self.store.locations[selectIndex.row];
    tvVC.location = location;
    
    }
}


@end
