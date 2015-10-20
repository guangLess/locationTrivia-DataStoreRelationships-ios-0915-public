//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Guang on 10/20/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStroe.h"

@interface FISAddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIButton *cancel;



- (IBAction)cancel:(id)sender;
- (IBAction)submit:(id)sender;

@end



@implementation FISAddLocationViewController

-(void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.cancel.accessibilityIdentifier = @"cancelButton";
    self.cancel.accessibilityLabel = @"cancelButton";
    self.submit.accessibilityLabel = @"submitButton";
    self.submit.accessibilityIdentifier = @"submitButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(IBAction)submit:(id)sender {
    /// do the things then
    
    FISLocation * newLocation = [[FISLocation alloc] initWithName:self.nameField.text latitude: (NSUInteger)self.latitudeField.text longitude:(NSUInteger)self.longitudeField.text];
    
    FISLocationsDataStroe * dataStore = [FISLocationsDataStroe sharedDataStore];
    [dataStore.locations addObject:newLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
