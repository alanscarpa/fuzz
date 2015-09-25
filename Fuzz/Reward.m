//
//  Reward.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "Reward.h"
#import <Parse/PFObject+Subclass.h>


@implementation Reward


+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"Reward";
}



@end
