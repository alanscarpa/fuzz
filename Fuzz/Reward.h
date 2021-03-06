//
//  Reward.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Reward : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *redemptionInstructions;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic) NSInteger amountAvailable;
@property (nonatomic) NSInteger scansAllowedPerDay;
@property (nonatomic, strong) NSData *image;
@property (nonatomic, strong) NSDate *winTime;
@property (nonatomic) BOOL isInstantWin;
@property (nonatomic) BOOL isPunch;
@property (nonatomic) BOOL ableToWinToday;

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description redemptionInstructions:(NSString *)instructions startDate:(NSDate *)startDate endDate:(NSDate *)endDate amountAvailable:(NSInteger)amountAvailable scansAllowedPerDay:(NSInteger)scansAllowedPerDay image:(NSData *)image winTime:(NSDate *)winTime isInstantWin:(BOOL)isInstantWin isPunch:(BOOL)isPunch ableToWinToday:(BOOL)ableToWinToday;

@end
