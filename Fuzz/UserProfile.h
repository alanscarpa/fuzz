//
//  UserProfile.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface UserProfile : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSData *profilePhoto;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *age;
@property (nonatomic) BOOL canSellEmail;

// Filled with UserLikes class objects
@property (nonatomic, strong) NSMutableArray *likes;


@end
