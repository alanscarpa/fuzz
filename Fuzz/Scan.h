//
//  Scan.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Business.h"
#import "FuzzUser.h"

@interface Scan : PFObject <PFSubclassing>

@property (nonatomic, strong) Business *business;
@property (nonatomic, strong) FuzzUser *user;

@property (nonatomic) BOOL canScanToday;
@property (nonatomic, strong) NSDate *lastScanDate;

@property (nonatomic) NSInteger numberOfScansTotal;
@property (nonatomic) NSInteger numberOfScansToday;

@property (nonatomic, strong) NSMutableArray *scanTimes;


@end
