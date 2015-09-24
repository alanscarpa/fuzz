//
//  Singletons.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/24/15.
//
//

#import "ScannerSingleton.h"

@implementation ScannerSingleton

+(instancetype)init
{
    static ScannerSingleton *_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[ScannerSingleton alloc] init];
    });
    
    return _singleton;
}

@end
