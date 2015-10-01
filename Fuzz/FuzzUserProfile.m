//
//  UserProfile.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "FuzzUserProfile.h"
#import <Parse/PFObject+Subclass.h>

@implementation FuzzUserProfile

@dynamic firstName, lastName, email, profilePhoto, city, state, age, canSellEmail, likes;

+(void)load
{
    [self registerSubclass];
}

+(NSString*)parseClassName
{
    return @"FuzzUserProfile";
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                     profilePhoto:(NSData *)photo
                             city:(NSString *)city
                            state:(NSString *)state
                              age:(NSString *)age
                     canSellEmail:(BOOL)canSellEmail
                            likes:(NSMutableArray *)likes {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.profilePhoto = photo;
        self.city = city;
        self.state = state;
        self.age = age;
        self.canSellEmail = canSellEmail;
        self.likes = likes;
    }
    return self;
}



@end
