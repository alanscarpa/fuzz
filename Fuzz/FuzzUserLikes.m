//
//  UserLikes.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "FuzzUserLikes.h"

@implementation FuzzUserLikes


@dynamic tvShows, movies, music, brands;


+(void)load
{
    [self registerSubclass];
}


+(NSString*)parseClassName
{
    return @"FuzzUserLikes";
}


@end
