//
//  UserProfile.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "UserProfile.h"
#import <Parse/PFObject+Subclass.h>

@implementation UserProfile

@dynamic firstName, lastName, email, profilePhoto, city, state, age, canSellEmail, likes;

+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"UserProfile";
}



@end
