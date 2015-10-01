//
//  User.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "UserProfile.h"

@interface FuzzUser : PFUser <PFSubclassing>

@property (nonatomic, strong) UserProfile *userProfile;

// scanned scan class has user pointer
// Full of Scan class
@property (nonatomic, strong) NSMutableArray *scans;

// Full of Awarded Rewards
@property (nonatomic, strong) NSMutableArray *rewards;

@end
