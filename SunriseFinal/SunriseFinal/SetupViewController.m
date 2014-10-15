#import "SetupViewController.h"
#import <CoreLocation/CoreLocation.h>

NSString * const kSetupInfoKeyAccuracy = @"SetupInfoKeyAccuracy";
NSString * const kSetupInfoKeyDistanceFilter = @"SetupInfoKeyDistanceFilter";
NSString * const kSetupInfoKeyTimeout = @"SetupInfoKeyTimeout";

static NSString * const kAccuracyNameKey = @"AccuracyNameKey";
static NSString * const kAccuracyValueKey = @"AccuracyValueKey";

@implementation SetupViewController

//@synthesize delegate;
@synthesize setupInfo;
@synthesize accuracyOptions;
@synthesize configureForTracking;
@synthesize accuracyPicker;
@synthesize slider;

- (void)viewDidLoad {
    NSMutableArray *options = [NSMutableArray array];
    [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"AccuracyBest", @"AccuracyBest"), kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyBest], kAccuracyValueKey, nil]];
    [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy10", @"Accuracy10"), kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyNearestTenMeters], kAccuracyValueKey, nil]];
    [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy100", @"Accuracy100"), kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyHundredMeters], kAccuracyValueKey, nil]];
    [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy1000", @"Accuracy1000"), kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyKilometer], kAccuracyValueKey, nil]];
    [options addObject:[NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Accuracy3000", @"Accuracy3000"), kAccuracyNameKey, [NSNumber numberWithDouble:kCLLocationAccuracyThreeKilometers], kAccuracyValueKey, nil]];
    self.accuracyOptions = options;
}

- (void)viewDidUnload {
    self.accuracyPicker = nil;
    self.slider = nil;
}

/*
- (void)dealloc {
    [accuracyPicker release];
    [slider release];
    [setupInfo release];
    [super dealloc];
}
 */

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [accuracyPicker selectRow:2 inComponent:0 animated:NO];
    self.setupInfo = [NSMutableDictionary dictionary];
    [setupInfo setObject:[NSNumber numberWithDouble:100.0] forKey:kSetupInfoKeyDistanceFilter]; 
    [setupInfo setObject:[NSNumber numberWithDouble:30] forKey:kSetupInfoKeyTimeout];
    [setupInfo setObject:[NSNumber numberWithDouble:kCLLocationAccuracyHundredMeters] forKey:kSetupInfoKeyAccuracy];
}

- (IBAction)done:(id)sender {
    /*
    [self dismissModalViewControllerAnimated:YES];
    if ([delegate respondsToSelector:@selector(setupViewController:didFinishSetupWithInfo:)]) {
        [delegate setupViewController:self didFinishSetupWithInfo:setupInfo];
    }
    */
}

- (IBAction)sliderChangedValue:(id)sender {
    if (configureForTracking) {
        [setupInfo setObject:[NSNumber numberWithDouble:pow(10, [(UISlider *)sender value])] forKey:kSetupInfoKeyDistanceFilter]; 
    } else {
        [setupInfo setObject:[NSNumber numberWithDouble:[(UISlider *)sender value]] forKey:kSetupInfoKeyTimeout];
    }
}

#pragma mark Picker DataSource/Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSDictionary *optionForRow = [accuracyOptions objectAtIndex:row];
    return [optionForRow objectForKey:kAccuracyNameKey];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSDictionary *optionForRow = [accuracyOptions objectAtIndex:row];
    [setupInfo setObject:[optionForRow objectForKey:kAccuracyValueKey] forKey:kSetupInfoKeyAccuracy];
}


@end
