//
//  SunriseDB.h
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "City.h"

@interface SunriseDB : NSObject
{
    sqlite3* _databaseConnection;
}

+ (SunriseDB*) database;
- (NSArray*) fetchCities;

@end
