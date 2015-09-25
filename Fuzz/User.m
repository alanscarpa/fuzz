//
//  User.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "User.h"
#import <Parse/PFObject+Subclass.h>

@implementation User


+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"User";
}


@end
