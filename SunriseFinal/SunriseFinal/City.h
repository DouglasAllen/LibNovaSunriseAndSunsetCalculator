//
//  City.h
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface City : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* state;
@property (readonly) NSString* latitudeString;
@property (readonly) NSString* longitudeString;
@property (readonly) NSString* timeZone;
@property (readonly) CLLocationCoordinate2D coord;


- (id) initWithName: (NSString*) cName andState: (NSString*) cState andTimeZone: (NSString*) cTimeZone andCoordinate: (CLLocationCoordinate2D) theCoordinate;

- (NSString*) latitudeString;
- (NSString*) longitudeString;

@end