//
//  UserLikes.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "UserLikes.h"

@implementation UserLikes


@dynamic tvShows, movies, music, brands;


+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"UserLikes";
}


@end
