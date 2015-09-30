//
//  User.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "User.h"
#import <Parse/PFObject+Subclass.h>

@implementation FuzzUser

@dynamic userProfile, scans, rewards;

+ (void)load
{
    [PFUser registerSubclass];
}


+(NSString*)parseClassName
{
    return @"User";
}


@end
