//
//  BusinessProfile.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "BusinessProfile.h"
#import <Parse/PFObject+Subclass.h>

@implementation BusinessProfile

@dynamic name;
@dynamic location;
@dynamic phoneNumber;
@dynamic website;
@dynamic facebook;
@dynamic twitter;
@dynamic instagram;
@dynamic logo;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString*)parseClassName
{
    return @"BusinessProfile";
}

- (instancetype)initWithName:(NSString *)name
                    location:(NSString *)location
                 phoneNumber:(NSString *)phoneNumber
                     website:(NSString *)website
                    facebook:(NSString *)facebook
                     twitter:(NSString *)twitter
                   instagram:(NSString *)instagram
                        logo:(NSData *)logo {
    self = [super init];
    if (self) {
        self.name = name;
        self.location = location;
        self.phoneNumber = phoneNumber;
        self.website = website;
        self.facebook = facebook;
        self.twitter = twitter;
        self.instagram = instagram;
        self.logo = logo;
    }
    return self;
}

@end
