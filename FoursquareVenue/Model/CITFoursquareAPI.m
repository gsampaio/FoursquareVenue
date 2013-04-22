//
//  CITFoursquareAPI.m
//  FoursquareVenue
//
//  Created by Guilherme Sampaio on 4/22/13.
//  Copyright (c) 2013 Ci&T. All rights reserved.
//

#import "CITFoursquareAPI.h"

NSString * const CITFoursquareAPIBaseURL = @"https://api.foursquare.com/v2/";

NSString * const CITFoursquareAPIClientSecret = @"MTLZQ1OMXBEKRJMQFCRIDUDLI3OKBBJ4Z4U5RTYIJQ13ZQF2";
NSString * const CITFoursquareAPIClientId = @"KY5RW4KSL0NVOVIY303OCVZD4XXJSHREHTSZGUNJA3FOGV30";

static NSString * NSStringFromCITFoursquareLocationCoordinate(CITFoursquareLocationCoordinate coordinate) {
    return [NSString stringWithFormat:@"%.8lf, %.8lf", coordinate.latitude, coordinate.longitude];
}

CITFoursquareLocationCoordinate CITFoursquareLocationCoordinateMake(double latitude, double longitude) {
    
    CITFoursquareLocationCoordinate coordinate;
    coordinate.latitude = latitude;
    coordinate.longitude = longitude;
    return coordinate;
}

@implementation CITFoursquareAPI

+ (id)sharedInstance
{
    static CITFoursquareAPI * _foursquareAPI;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _foursquareAPI = [[CITFoursquareAPI alloc] initWithBaseURL:[NSURL URLWithString:CITFoursquareAPIBaseURL]];
    });
    return _foursquareAPI;
}


- (void)venuesAtLocation:(CITFoursquareLocationCoordinate)coordinate withCompletion:(void(^)(BOOL success, id response, NSError*error))completion {
    
    NSDictionary *parameters = @{
                                 @"ll" : NSStringFromCITFoursquareLocationCoordinate(coordinate),
                                 @"client_id" : CITFoursquareAPIClientId,
                                 @"client_secret" : CITFoursquareAPIClientSecret
                                 };
    NSURLRequest *request = [self requestWithMethod:@"GET" path:@"venues/search" parameters:parameters];

    AFJSONRequestOperation *venueRequest = [[AFJSONRequestOperation alloc] initWithRequest:request];
    
    [venueRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id response){
        NSLog(@"Response: %@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [self enqueueHTTPRequestOperation:venueRequest];
}

@end
