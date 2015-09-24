//
//  Singletons.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/24/15.
//
//

#import "Singletons.h"

@implementation Singletons

+(instancetype)captureSessionSingleton
{
    static Singletons *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[Singletons alloc] init];
    });
    
    return _sharedDataStore;
}

@end
