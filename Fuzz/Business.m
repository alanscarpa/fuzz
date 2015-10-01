//
//  Business.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "Business.h"
#import <Parse/PFObject+Subclass.h>

@implementation Business

@dynamic businessProfile;
@dynamic name;
@dynamic rewards;
@dynamic SKU;
@dynamic usersWhoHaveScanned;
@dynamic averageRevenuePerCustomer;
@dynamic numberOfScansReceived;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Business";
}

- (instancetype)initWithName:(NSString *)name
                             profile:(BusinessProfile *)profile
                             rewards:(NSMutableArray *)rewards
                                 SKU:(NSString *)SKU
                 usersWhoHaveScanned:(NSMutableArray *)usersWhoHaveScanned
           averageRevenuePerCustomer:(NSInteger)averageRevenuePerCustomer
               numberOfScansReceived:(NSInteger)numberOfScansReceived {
    self = [super init];
    if (self) {
        self.name = name;
        self.businessProfile = profile;
        self.rewards = rewards;
        self.SKU = SKU;
        self.usersWhoHaveScanned = usersWhoHaveScanned;
        self.averageRevenuePerCustomer = averageRevenuePerCustomer;
        self.numberOfScansReceived = numberOfScansReceived;
    }
    return self;
}

@end
