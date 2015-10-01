//
//  ParseHandler.m
//  Fuzz
//
//  Created by Alan Scarpa on 10/1/15.
//
//

#import "ParseHandler.h"
#import <Parse/Parse.h>


@implementation ParseHandler

+ (void)registerNewBusinessOnParse:(Business *)newBusiness
{
    [newBusiness saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded){
            NSLog(@"Saved custom thing!!");
        } else {
            NSLog(@"Errrrrror: %@", error);
        }
    }];
}

+ (NSMutableArray *)createRewards {
    NSMutableArray *rewards = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 3; i++){
        Reward *reward = [[Reward alloc] initWithTitle:@"Reward 1" description:@"Free soda!" redemptionInstructions:@"Go to counter and show this to cashier." startDate:[NSDate date] endDate:nil amountAvailable:100 scansAllowedPerDay:1 image:nil winTime:[NSDate date] isInstantWin:YES isPunch:NO ableToWinToday:YES];
        [rewards addObject:reward];
    }
    return rewards;
}

+ (BusinessProfile *)createBusinessProfile {
    return [[BusinessProfile alloc] initWithName:@"Burger King" location:@"123 st" phoneNumber:@"7328347232" website:@"something.com" facebook:@"facebook.com/burgerking" twitter:@"twitter.com/burgerking" instagram:@"instagram.com/burgerking" logo:nil];
}

+ (Business *)createBusinessWithProfile:(BusinessProfile *)profile andRewards:(NSMutableArray *)rewards {
    return [[Business alloc] initWithName:@"Burger King" profile:profile rewards:rewards SKU:@"999" usersWhoHaveScanned:[[NSMutableArray alloc] init] averageRevenuePerCustomer:9 numberOfScansReceived:0];
}

+ (void)registerNewUserOnParse:(FuzzUser *)user {
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Successfully signed up new user");
        } else {
            NSLog(@"Error signing up new user:%@", error);
        }
    }];
}

+ (FuzzUserProfile *)createNewUserProfile {
    return [[FuzzUserProfile alloc] initWithFirstName:@"Bob" lastName:@"Castro" email:@"bob@g.com" profilePhoto:nil city:@"Ocean" state:@"NJ" age:@"44" canSellEmail:YES likes:[[NSMutableArray alloc] init]];
}

+ (FuzzUser *)createNewUserWithProfile:(FuzzUserProfile *)profile email:(NSString *)email password:(NSString *)password {
    return [[FuzzUser alloc] initWithUserProfile:profile email:email password:password scans:[[NSMutableArray alloc] init] rewards:[[NSMutableArray alloc] init]];
}

@end
