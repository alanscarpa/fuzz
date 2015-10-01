//
//  User.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "FuzzUser.h"
#import <Parse/PFObject+Subclass.h>

@implementation FuzzUser

@dynamic userProfile, scans, rewards;

+ (void)load
{
    [PFUser registerSubclass];
}


+ (NSString*)parseClassName
{
    return @"User";
}

- (instancetype)initWithUserProfile:(FuzzUserProfile *)profile email:(NSString *)email password:(NSString *)password scans:(NSMutableArray *)scans rewards:(NSMutableArray *)rewards {
    self = [super init];
    if (self) {
        self.username = email;
        self.password = password;
        self.email = email;
        self.userProfile = profile;
        self.scans = scans;
        self.rewards = rewards;
    }
    return self;
}



@end
