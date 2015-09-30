//
//  AwardedReward.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "AwardedReward.h"

@implementation AwardedReward

@dynamic user, reward, wasRedeemed;

+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"AwardedReward";
}


@end
