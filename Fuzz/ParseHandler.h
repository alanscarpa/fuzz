//
//  ParseHandler.h
//  Fuzz
//
//  Created by Alan Scarpa on 10/1/15.
//
//

#import <Foundation/Foundation.h>
#import "Business.h"
#import "Reward.h"
#import "BusinessProfile.h"
#import "FuzzUser.h"

@interface ParseHandler : NSObject

+ (void)registerNewBusinessOnParse:(Business *)newBusiness;
+ (NSMutableArray *)createRewards;
+ (BusinessProfile *)createBusinessProfile;
+ (Business *)createBusinessWithProfile:(BusinessProfile *)profile andRewards:(NSMutableArray *)rewards;
+ (void)registerNewUserOnParse:(FuzzUser *)user;
+ (FuzzUserProfile *)createNewUserProfile;
+ (FuzzUser *)createNewUserWithProfile:(FuzzUserProfile *)profile email:(NSString *)email password:(NSString *)password;

@end
