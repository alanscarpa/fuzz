//
//  BusinessProfile.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "BusinessProfile.h"
#import <Parse/PFObject+Subclass.h>


@implementation BusinessProfile

@dynamic name;
@dynamic location;
@dynamic phoneNumber;
@dynamic website;
@dynamic facebook;
@dynamic twitter;
@dynamic instagram;
@dynamic logo;

+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"BusinessProfile";
}

@end
