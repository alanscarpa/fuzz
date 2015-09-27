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
    
    
    
    // put reward in user rewards array
    [self getReward];

    
    
}


-(void)registerBusiness
{
    Business *biz = [Business object];
    biz.averageRevenuePerCustomer = 4;
    biz.name = @"Coca-Cola";
    biz.SKU = @"004";
    
    BusinessProfile *bizProfile = [BusinessProfile object];
    bizProfile.name = @"Coca-Cola";
    
    biz.businessProfile = bizProfile;
    
    Reward *reward = [Reward object];
    reward.title = @"Free Soda!";
    reward.description = @"One free soda";
    reward.ableToWinToday = YES;
    reward.amountAvailable = 100;
    reward.winTime = [NSDate date];
    
    biz.rewards = [@[reward] mutableCopy];
    
    [biz saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded){
            NSLog(@"Saved custom thing!!");
            
            
        } else {
            NSLog(@"Errrrrror: %@", error);
        }
    }];
 
}

-(void)getReward
{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Business"];
    [query includeKey:@"rewards"];
    [query includeKey:@"businessProfile"];
    [query whereKey:@"SKU" equalTo:@"004"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       // NSLog(@"%@", objects[0][@"businessProfile"][@"name"]);
        if ([objects[0][@"rewards"] count]>0){
            
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
                    // yourDate is in the past
                    NSLog(@"Congratulations!  You've won! \n%@\n%@",objects[0][@"rewards"][0][@"title"],objects[0][@"rewards"][0][@"description"]);
                    validRewards[0][@"ableToWinToday"] = @NO;
                    [validRewards[0] save];
                }
            }
            
        }
//        NSLog(@"%@", objects[0][@"rewards"][0][@"title"]);
//        NSLog(@"%@", objects[0][@"rewards"][0][@"description"]);
    }];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
