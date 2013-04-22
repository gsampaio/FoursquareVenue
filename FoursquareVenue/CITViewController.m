//
//  CITViewController.m
//  FoursquareVenue
//
//  Created by Guilherme Sampaio on 4/22/13.
//  Copyright (c) 2013 Ci&T. All rights reserved.
//

#import "CITViewController.h"
#import "CITFoursquareAPI.h"

@interface CITViewController ()

@end

@implementation CITViewController

- (void)viewWillAppear:(BOOL)animated
{
    CITFoursquareLocationCoordinate coordinate = CITFoursquareLocationCoordinateMake(44.3, 37.2);
    
    CITFoursquareAPI *foursquareAPI = [CITFoursquareAPI sharedInstance];
    [foursquareAPI venuesAtLocation:coordinate withCompletion:^(BOOL success, id response, NSError *error) {
        if (success) {
            NSLog(@"Response: %@", response);
        } else {
            NSLog(@"Error: %@", error);
        }
    }];
}
@end
