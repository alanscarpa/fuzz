//
//  AwardedReward.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Reward.h"
#import "FuzzUser.h"

@interface AwardedReward : PFObject <PFSubclassing>

@property (nonatomic, strong) FuzzUser *user;
@property (nonatomic, strong) Reward *reward;
@property (nonatomic) BOOL wasRedeemed;


@end
