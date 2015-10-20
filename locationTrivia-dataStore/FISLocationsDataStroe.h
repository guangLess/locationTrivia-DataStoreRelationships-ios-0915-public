//
//  FISLocationsDataStroe.h
//  locationTrivia-dataStore
//
//  Created by Guang on 10/20/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISLocationsDataStroe : NSObject

+(FISLocationsDataStroe *)sharedDataStore;

@property(strong, nonatomic)NSMutableArray * locations;

@end
