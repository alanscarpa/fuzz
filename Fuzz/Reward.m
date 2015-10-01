//
//  Reward.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import "Reward.h"
#import <Parse/PFObject+Subclass.h>


@implementation Reward

@dynamic title, description, redemptionInstructions, startDate, endDate, amountAvailable,scansAllowedPerDay, image, winTime, isInstantWin, isPunch, ableToWinToday;

+ (void)load{
    [self registerSubclass];
}

+ (NSString*)parseClassName{
    return @"Reward";
}

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)description
       redemptionInstructions:(NSString *)instructions
                    startDate:(NSDate *)startDate
                      endDate:(NSDate *)endDate
              amountAvailable:(NSInteger)amountAvailable
           scansAllowedPerDay:(NSInteger)scansAllowedPerDay
                        image:(NSData *)image
                      winTime:(NSDate *)winTime
                 isInstantWin:(BOOL)isInstantWin
                      isPunch:(BOOL)isPunch
               ableToWinToday:(BOOL)ableToWinToday {
    self = [super init];
    if (self) {
        self.title = title;
        self.description = description;
        self.redemptionInstructions = instructions;
        self.startDate = startDate;
        self.endDate = endDate;
        self.amountAvailable = amountAvailable;
        self.scansAllowedPerDay = scansAllowedPerDay;
        self.image = image;
        self.winTime = winTime;
        self.isInstantWin = isInstantWin;
        self.isPunch = isPunch;
        self.ableToWinToday = ableToWinToday;
    }
    return self;
}



@end
