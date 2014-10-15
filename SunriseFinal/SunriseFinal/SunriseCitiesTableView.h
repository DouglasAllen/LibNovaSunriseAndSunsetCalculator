//
//  SunriseCitiesTableView.h
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/11/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "SunriseDB.h"

@interface SunriseCitiesTableView : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray* cities;

@end