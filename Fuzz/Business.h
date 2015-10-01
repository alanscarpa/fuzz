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
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *rewards;
@property (nonatomic, strong) NSString *SKU;
@property (nonatomic, strong) NSMutableArray *usersWhoHaveScanned;
@property (nonatomic) NSInteger averageRevenuePerCustomer;
@property (nonatomic) NSInteger numberOfScansReceived;

- (instancetype)initWithName:(NSString *)name
                             profile:(BusinessProfile *)profile
                             rewards:(NSMutableArray *)rewards
                                 SKU:(NSString *)SKU
                 usersWhoHaveScanned:(NSMutableArray *)users
           averageRevenuePerCustomer:(NSInteger)averageRevenuePerCustomer
               numberOfScansReceived:(NSInteger)numberOfScansReceived;

@end
