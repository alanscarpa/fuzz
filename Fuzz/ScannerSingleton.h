//
//  Singletons.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/24/15.
//
//

#import <Foundation/Foundation.h>
#import <Moodstocks/Moodstocks.h>

@interface ScannerSingleton : NSObject

@property (strong, nonatomic) MSAutoScannerSession *scannerSession;
@property MSScanner *scanner;

@end
