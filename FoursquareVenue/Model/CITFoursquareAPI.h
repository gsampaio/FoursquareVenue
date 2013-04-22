//
//  CITFoursquareAPI.h
//  FoursquareVenue
//
//  Created by Guilherme Sampaio on 4/22/13.
//  Copyright (c) 2013 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


typedef struct _CITFoursquareLocationCoordinate{
    double latitude;
    double longitude;
} CITFoursquareLocationCoordinate;

static NSString * NSStringFromCITFoursquareLocationCoordinate(CITFoursquareLocationCoordinate coordinate);

CITFoursquareLocationCoordinate CITFoursquareLocationCoordinateMake(double latitude, double longitude);

@interface CITFoursquareAPI : AFHTTPClient
+ (id) sharedInstance;
- (void)venuesAtLocation:(CITFoursquareLocationCoordinate)coordinate withCompletion:(void(^)(BOOL success, id response, NSError*error))completion;
@end
