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
    self.submit.accessibilityLabel = @"saveButton";
    self.submit.accessibilityIdentifier = @"saveButton";
    
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    
    self.nameField.accessibilityLabel = @"nameField";
    self.nameField.accessibilityIdentifier = @"nameField";
    
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.longitudeField.accessibilityLabel = @"longitudeField";
    
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    
    
}






-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(IBAction)submit:(id)sender {
    /////////lecture NOTE
    
    
    if (![self inputIsValid]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"wrong data" message:@"wrong data" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    
    CGFloat lat = self.latitudeField.text.floatValue; // double/float value double is more acura
    CGFloat longti = self.longitudeField.text.floatValue;
    
    FISLocation * newLocation = [[FISLocation alloc] initWithName:self.nameField.text
                                                         latitude:lat
                                                        longitude:longti];
    
    [[FISLocationsDataStroe sharedDataStore].locations addObject:newLocation];
    
//    FISLocationsDataStroe * dataStore = [FISLocationsDataStroe sharedDataStore];
//    [dataStore.locations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)inputIsValid{
    
    
    BOOL hasName = self.nameField.text.length > 0;
    BOOL hasLati = self.latitudeField.text.length > 0;
    BOOL hasLongti = self.longitudeField.text.length > 0;
    
    return hasName & hasLati & hasLongti;
}




@end
