//
//  Scan.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "Scan.h"

@implementation Scan

@dynamic business;
@dynamic user;

@dynamic canScanToday;
@dynamic lastScanDate;

@dynamic numberOfScansTotal;
@dynamic numberOfScansToday;

@dynamic scanTimes;

+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"Scan";
}


@end
