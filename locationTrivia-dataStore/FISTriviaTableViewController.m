//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Guang on 10/20/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISTrivium.h"
#import "FISAddTriviaViewController.h"

@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.location.trivia.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //cell.textLabel.text = [self.location.trivia[indexPath.row] name];
    
    FISTrivium * eachTrivium = self.location.trivia[indexPath.row];
    cell.textLabel.text = eachTrivium.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",eachTrivium.likes];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FISAddTriviaViewController * addVC = segue.destinationViewController;
    //NSIndexPath * selectIndex = self.tableView.indexPathForSelectedRow;
    
    FISLocation * passOnlocation = self.location;
    addVC.location = passOnlocation;
}

@end
