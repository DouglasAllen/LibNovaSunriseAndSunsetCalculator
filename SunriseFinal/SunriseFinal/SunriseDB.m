//
//  SunriseDB.m
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import "SunriseDB.h"

@implementation SunriseDB

static SunriseDB* _databaseObj;

+ (SunriseDB*) database
{
    if (_databaseObj == nil) {
        _databaseObj = [[SunriseDB alloc] init];
    }
    return _databaseObj;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"db"];
        if (sqlite3_open([dbpath UTF8String], &_databaseConnection) != SQLITE_OK) {
        }
        else {
        }
    }
    return self;
}

- (NSArray*) fetchCities
{
    NSMutableArray* cities = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM cities;";
    sqlite3_stmt *stmt;
    
    const unsigned char* text;
    NSString *name, *state, *timeZone;
    double lat, lon;
    
    if( sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            //Get name
            text = sqlite3_column_text(stmt, 0);
            if(text){
                name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            }
            else {
                name = nil;
            }
            //Get state
            text = sqlite3_column_text(stmt, 1);
            if(text) {
                state = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            }
            else {
                state = nil;
            }
            //Get latitude
            lat = sqlite3_column_double(stmt, 2);
            //Get longitude
            lon = sqlite3_column_double(stmt, 3);
            //Get timeZone
            text = sqlite3_column_text(stmt, 4);
            if(text){
                timeZone = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            }
            else{
                timeZone = nil;
            }
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lon, lat);
            City *thisCity = [[City alloc] initWithName:name andState:state andTimeZone:timeZone andCoordinate:coord];
            [cities addObject: thisCity];
        }
        sqlite3_finalize(stmt);
    }
    return cities;
}
@end
