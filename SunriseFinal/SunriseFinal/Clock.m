//
//  Clock.m
//  SunriseFinal
//
//  Created by Andrew Mauricio on 12/17/13.
//  Copyright (c) 2013 amauricio. All rights reserved.
//

#import "Clock.h"

@implementation Clock

inline double rad(double deg)
{
    return deg / 180.0 * M_PI;
}

- (void) drawLineForContext:(const CGContextRef&)context Width:(float)_width angle:(double)_angle length:(double)radius
{
    CGPoint c = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
    CGContextSetLineWidth(context, _width);
    CGContextMoveToPoint(context, self.center.x, self.center.y);
    CGPoint addLines[] =
    {
        CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0),
        CGPointMake(radius*cos(_angle) +c.x, radius*sin(_angle) +c.y),
    };
    
    CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
    CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate* now = [NSDate date];
    int h = [[cal components:NSHourCalendarUnit fromDate:now] hour];
    int m = [[cal components:NSMinuteCalendarUnit fromDate:now] minute];
    int s = [[cal components:NSSecondCalendarUnit fromDate:now] second];
    
    BOOL isAM = hdouble hAlpha = rad((isAM?h:h-12)*30 +(30*m/60) -90);
    double mAlpha = rad(m*6 -90);
    double sAlpha = rad(s*6 -90);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    [self drawLineForContext:context Width:8.0 angle:hAlpha length:self.frame.size.width/2.0 - 18];
    [self drawLineForContext:context Width:5.0 angle:mAlpha length:self.frame.size.width/2.0 - 12];
    [self drawLineForContext:context Width:2.0 angle:sAlpha length:self.frame.size.width/2.0 - 10];
}

-(void)update
{
    [self setNeedsDisplay];
}

-(void)startClockUpdates
{
    [self update];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
}
-(void)stopClockUpdates
{
    [timer invalidate], timer = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
    [clock startClockUpdates];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [clock stopClockUpdates];
}

- (void)dealloc {
    [super dealloc];
}

@end
