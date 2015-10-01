//
//  UserProfile.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface FuzzUserProfile : PFObject <PFSubclassing>

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

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                     profilePhoto:(NSData *)photo
                             city:(NSString *)city
                            state:(NSString *)state
                              age:(NSString *)age
                     canSellEmail:(BOOL)canSellEmail
                            likes:(NSMutableArray *)likes;

@end
