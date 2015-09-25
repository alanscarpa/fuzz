//
//  Business.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import "BusinessProfile.h"
#import <Parse/Parse.h>

@interface Business : PFObject <PFSubclassing>

@property (nonatomic, strong) BusinessProfile *businessProfile;
@property (nonatomic, strong) NSMutableArray *rewards;
@property (nonatomic, strong) NSNumber *SKU;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic) NSInteger averageRevenuePerCustomer;


@end
