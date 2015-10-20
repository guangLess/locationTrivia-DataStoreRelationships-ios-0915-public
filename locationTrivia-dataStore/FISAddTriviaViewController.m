//
//  FISAddTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Guang on 10/20/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISLocationsDataStroe.h"
#import "FISTrivium.h"

@interface FISAddTriviaViewController ()

- (IBAction)addButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButtonLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButtonLabel;

@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
      Set their accessibility labels & identifiers to @"Trivium Text Field", @"Cancel Button", and @"Save Button"
     */
    
    self.textField.accessibilityLabel = @"Trivium Text Field";
    self.textField.accessibilityIdentifier = @"Trivium Text Field";
    
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Save Button";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Save Button";
    
    self.navigationItem.leftBarButtonItem.accessibilityLabel = @"Cancel Button";
    self.navigationItem.leftBarButtonItem.accessibilityIdentifier = @"Cancel Button";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addButton:(id)sender {
    
    FISTrivium * trivium = [[FISTrivium alloc] initWithContent:self.textField.text likes:0];
    [self.location.trivia addObject:trivium];
    NSUInteger index = [[FISLocationsDataStroe sharedDataStore].locations indexOfObject:self.location];
    [[[FISLocationsDataStroe sharedDataStore].locations[index] trivia] addObject:trivium];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)cancelButton:(id)sender {

    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
