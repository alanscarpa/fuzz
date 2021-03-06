//
//  BusinessProfile.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/25/15.
//
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface BusinessProfile : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *facebook;
@property (nonatomic, strong) NSString *twitter;
@property (nonatomic, strong) NSString *instagram;
@property (nonatomic, strong) NSData *logo;

- (instancetype)initWithName:(NSString *)name location:(NSString *)location phoneNumber:(NSString *)phoneNumber website:(NSString *)website facebook:(NSString *)facebook twitter:(NSString *)twitter instagram:(NSString *)instagram logo:(NSData *)logo;

@end
