//
//  City.m
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import "City.h"

@implementation City

@synthesize name;
@synthesize state;
@synthesize timeZone;
@synthesize coord;

- (id) initWithName: (NSString*) cName andState: (NSString*) cState andTimeZone: (NSString*) cTimeZone andCoordinate: (CLLocationCoordinate2D) theCoordinate
{
    self = [super init];
    if( self ){
        name = cName;
        state = cState;
        timeZone = cTimeZone;
        coord = CLLocationCoordinate2DMake(theCoordinate.longitude, theCoordinate.latitude);
    }
    return self;
}

- (NSString*) longitudeString{
    double theta = coord.longitude;
    double deg = floor(theta);
    double min = floor((theta - deg) * 60.0);
    double sec = floor((theta - deg - (min/60.0)) * 3600.0);
    return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

- (NSString*) latitudeString{
    double theta = coord.latitude;
    double deg = floor(theta);
    double min = floor((theta - deg) * 60.0);
    double sec = floor((theta - deg - (min/60.0)) * 3600.0);
    return [NSString stringWithFormat: @"%g° %g' %g\"", deg, min, sec];
}

@end
