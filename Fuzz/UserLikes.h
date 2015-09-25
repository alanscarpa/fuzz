//
//  UserLikes.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface UserLikes : PFObject <PFSubclassing>


@property (nonatomic, strong) NSMutableArray *tvShows;
@property (nonatomic, strong) NSMutableArray *movies;
@property (nonatomic, strong) NSMutableArray *music;
@property (nonatomic, strong) NSMutableArray *brands;


@end
