//
//  FeedViewController.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/22/15.
//  Copyright © 2015 Moodstocks. All rights reserved.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "Business.h"
#import "BusinessProfile.h"
#import "Reward.h"
#import "FuzzUser.h"
#import "FuzzUserProfile.h"
#import "AwardedReward.h"
#import "ParseHandler.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    // found Rook Logo
    
    // check if business' rewards array.
    // check what rewards have amountAvailable > 0
    // check if ableToWinToday is true
    // put those awards in array
    // randomly pick one award
    // check if currentTime > award's winTime
    // if currentTime>winTime then
    // reward award
    // set ableToWinToday to false
    // -1 amountAvailble
    // reset reward winTime at 12am - set between 6am and 10pm
    
    
    // -------- Step 1) --------
    // Create a new user
    // -------- Step 2) --------
    // Log in user
    // Have them scan logo
    // Win reward
    // Update reward status on Parse
    // Save reward to user's awarded reward on Parse and locally with Core data
    // -------- Step 3) --------
    // View user's awarded rewards
    // -------- Step 4) --------
    // Press Redeem Now Button to delete from users rewarded awards
    
    
    //[self registerNewBusiness];
    //[self registerNewFuzzUser];
    //[self getReward];
    
}

- (void)registerNewBusiness {
    BusinessProfile *profile = [ParseHandler createBusinessProfile];
    NSMutableArray *rewards = [ParseHandler createRewards];
    Business *newBusiness = [ParseHandler createBusinessWithProfile:profile andRewards:rewards];
    [ParseHandler registerNewBusinessOnParse:newBusiness];
}


-(void)registerNewFuzzUser {
    FuzzUserProfile *newProfile = [ParseHandler createNewUserProfile];
    FuzzUser *newUser = [ParseHandler createNewUserWithProfile:newProfile email:@"test@g.com" password:@"test"];
    [ParseHandler registerNewUserOnParse:newUser];
}


-(void)getReward {
    PFQuery *query = [PFQuery queryWithClassName:@"Business"];
    [query includeKey:@"rewards"];
    [query includeKey:@"businessProfile"];
    [query whereKey:@"SKU" equalTo:@"004"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       // NSLog(@"%@", objects[0][@"businessProfile"][@"name"]);
        if ([objects[0][@"rewards"] count] > 0){
            
            NSMutableArray *validRewards = [@[] mutableCopy];
            for (PFObject *reward in objects[0][@"rewards"]){
                if ([reward[@"ableToWinToday"] isEqual:@YES]){
                    [validRewards addObject:reward];
                }
            }
            
            // pick a random reward between 0 and count
            // implement later
            if (validRewards.count > 0){
                if ([[NSDate date] timeIntervalSince1970] > [validRewards[0][@"winTime"] timeIntervalSince1970]) {
                    
                    NSLog(@"Congratulations!  You've won! \n%@\n%@",objects[0][@"rewards"][0][@"title"], objects[0][@"rewards"][0][@"description"]);
                    
                    validRewards[0][@"ableToWinToday"] = @NO;
                    
                    // set random time for reward
                    // write a script that sets ableToWinToday to @YES every morning at 12am
                    
                    [validRewards[0] saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                        FuzzUser *newUser = [FuzzUser object];
                        FuzzUserProfile *newUserProfile = [FuzzUserProfile object];
                        newUserProfile.firstName = @"Bob";
                        newUser.userProfile = newUserProfile;
                        
                        AwardedReward *awardedReward = [AwardedReward object];
                        awardedReward.reward = validRewards[0];
                        newUser.rewards = [@[awardedReward] mutableCopy];
                        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                            //
                        }];
                    }];
                }
            }
        }
    }];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
