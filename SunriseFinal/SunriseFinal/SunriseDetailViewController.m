//
//  SunriseDetailViewController.m
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/16/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import "SunriseDetailViewController.h"
#include <libnova/solar.h>
#include <libnova/julian_day.h>
#include <libnova/rise_set.h>
#include <libnova/transform.h>
#include <libnova/utility.h>
#include <libnova/refraction.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sunriseStandardHour,
    sunriseStandardMinutes,
    sunriseCivilHour,
    sunriseCivilMinutes,
    sunriseNauticHour,
    sunriseNauticMinutes,
    sunriseAstroHour,
    sunriseAstroMinutes,
    sunsetStandardHour,
    sunsetStandardMinutes,
    sunsetCivilHour,
    sunsetCivilMinutes,
    sunsetNauticHour,
    sunsetNauticMinutes,
    sunsetAstroHour,
    sunsetAstroMinutes;

@interface SunriseDetailViewController () {
    double thisLatitude;
    double thisLongitude;
}

@end

@implementation SunriseDetailViewController

@synthesize city;
@synthesize officialSunrise;
@synthesize officialSunset;
@synthesize nauticalSunrise;
@synthesize nauticalSunset;
@synthesize astroSunrise;
@synthesize astroSunset;
@synthesize civilSunrise;
@synthesize civilSunset;

/*********************************************************
**BEGIN LIBNOVA CODE BELOW *******************************
**********************************************************/
static struct ln_lnlat_posn observer;
static double JD;
static struct ln_helio_posn pos;
static struct ln_equ_posn equ;

void calc_common(double lat,double lon) {
    observer.lat = lat;
    observer.lng = lon;
    JD = ln_get_julian_from_sys();
    ln_get_solar_geom_coords(JD, &pos);
    ln_get_solar_equ_coords(JD, &equ);
}

void calc_rst(uint16_t *dest) {
    struct ln_rst_time rst;
    struct ln_zonedate rise, set, transit;
    if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_STANDART_HORIZON, &rst) == 1 ){
    }else{
        ln_get_local_date(rst.rise, &rise);
        ln_get_local_date(rst.transit, &transit);
        ln_get_local_date(rst.set, &set);
        sunriseStandardHour = rise.hours;
        sunriseStandardMinutes = rise.minutes;
        sunsetStandardHour = set.hours;
        sunsetStandardMinutes = set.minutes;
    }
    if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_CIVIL_HORIZON, &rst) == 1 ){
    }else{
        ln_get_local_date(rst.rise, &rise);
        ln_get_local_date(rst.transit, &transit);
        ln_get_local_date(rst.set, &set);
        sunriseCivilHour = rise.hours;
        sunriseCivilMinutes = rise.minutes;
        sunsetCivilHour = set.hours;
        sunsetCivilMinutes = set.minutes;
    }
    if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_NAUTIC_HORIZON, &rst) == 1 ){
    }else{
        ln_get_local_date(rst.rise, &rise);
        ln_get_local_date(rst.transit, &transit);
        ln_get_local_date(rst.set, &set);
        sunriseNauticHour = rise.hours;
        sunriseNauticMinutes = rise.minutes;
        sunsetNauticHour = set.hours;
        sunsetNauticMinutes = set.minutes;
    }    
    if( ln_get_solar_rst_horizon(JD, &observer, LN_SOLAR_ASTRONOMICAL_HORIZON, &rst) == 1 ){
    }else{
        ln_get_local_date(rst.rise, &rise);
        ln_get_local_date(rst.transit, &transit);
        ln_get_local_date(rst.set, &set);
        sunriseAstroHour = rise.hours;
        sunriseAstroMinutes = rise.minutes;
        sunsetAstroHour = set.hours;
        sunsetAstroMinutes = set.minutes;
    }
}
/**********************************************************
 **END LIBNOVA CODE BELOW *********************************
 **********************************************************/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    thisLatitude = [city.latitudeString doubleValue];
    thisLongitude = [city.longitudeString doubleValue];

    uint16_t d[10];
    calc_common(thisLatitude, thisLongitude);
    calc_rst(d);
    
    officialSunrise.text = [NSString stringWithFormat:@"%.2d:%.2d",sunriseStandardHour,sunriseStandardMinutes];
    officialSunset.text = [NSString stringWithFormat:@"%.2d:%.2d",sunsetStandardHour,sunsetStandardMinutes];
    nauticalSunrise.text = [NSString stringWithFormat:@"%.2d:%.2d",sunriseNauticHour,sunriseNauticMinutes];
    nauticalSunset.text = [NSString stringWithFormat:@"%.2d:%.2d",sunsetNauticHour,sunsetNauticMinutes];
    astroSunrise.text = [NSString stringWithFormat:@"%.2d:%.2d",sunriseAstroHour,sunriseAstroMinutes];
    astroSunset.text = [NSString stringWithFormat:@"%.2d:%.2d",sunsetAstroHour,sunsetAstroMinutes];
    civilSunrise.text = [NSString stringWithFormat:@"%.2d:%.2d",sunriseCivilHour,sunriseCivilMinutes];
    civilSunset.text = [NSString stringWithFormat:@"%.2d:%.2d",sunsetCivilHour,sunsetCivilMinutes];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}

@end
