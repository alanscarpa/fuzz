//
//  FeedViewController.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/22/15.
//  Copyright © 2015 Moodstocks. All rights reserved.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>

@interface FeedViewController ()


@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dimensions = @{
                                 // What type of news is this?
                                 @"category": @"politics",
                                 // Is it a weekday or the weekend?
                                 @"dayType": @"weekday",
                                 };
    // Send the dimensions to Parse along with the 'read' event
    
    [PFAnalytics trackEventInBackground:@"write" dimensions:dimensions block:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded){
            NSLog(@"succeeded");
        } else {
            NSLog(@"%@", error);
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
