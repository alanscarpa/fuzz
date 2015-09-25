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


+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"UserProfile";
}



@end
