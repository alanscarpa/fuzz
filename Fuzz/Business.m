//
//  Business.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "Business.h"
#import <Parse/PFObject+Subclass.h>

@implementation Business

@dynamic businessProfile;
@dynamic name;
@dynamic rewards;
@dynamic SKU;
@dynamic users;
@dynamic averageRevenuePerCustomer;
@dynamic numberOfScansReceived;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Business";
}


@end
