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

@interface FeedViewController ()


@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Business *biz = [Business object];
    biz.averageRevenuePerCustomer = 4;
    
    BusinessProfile *bizProfile = [BusinessProfile object];
    bizProfile.name = @"Rook";
    
    biz.businessProfile = bizProfile;
    
    [biz saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded){
            NSLog(@"Saved custom thing!!");
        } else {
            NSLog(@"Errrrrror: %@", error);
        }
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
