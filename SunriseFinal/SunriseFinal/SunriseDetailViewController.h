//
//  SunriseDetailViewController.h
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface SunriseDetailViewController : UIViewController

@property (weak, nonatomic) City* city;
@property (weak, nonatomic) IBOutlet UILabel *sunriseTest;
@property (weak, nonatomic) IBOutlet UILabel *officialSunrise;
@property (weak, nonatomic) IBOutlet UILabel *officialSunset;
@property (weak, nonatomic) IBOutlet UILabel *nauticalSunrise;
@property (weak, nonatomic) IBOutlet UILabel *nauticalSunset;
@property (weak, nonatomic) IBOutlet UILabel *astroSunrise;
@property (weak, nonatomic) IBOutlet UILabel *astroSunset;
@property (weak, nonatomic) IBOutlet UILabel *civilSunrise;
@property (weak, nonatomic) IBOutlet UILabel *civilSunset;

@end
