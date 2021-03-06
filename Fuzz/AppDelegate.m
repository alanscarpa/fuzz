/**
 * Copyright (c) 2014 Moodstocks SAS
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "AppDelegate.h"
#import <Moodstocks/Moodstocks.h>
#import "ScannerViewController.h"
#import "ScannerSingleton.h"
#import "Constants.h"
#import <Parse/Parse.h>


@implementation AppDelegate {
    ScannerSingleton *_scannerSingleton;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeScanner];
    [self initializeParse];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}



- (void)applicationWillTerminate:(UIApplication *)application
{
    [_scannerSingleton.scanner close:nil];
}



-(void)initializeScanner
{
    _scannerSingleton = [ScannerSingleton init];
    
    NSString *path = [MSScanner cachesPathFor:@"scanner.db"];
    _scannerSingleton.scanner = [[MSScanner alloc] init];
    _scannerSingleton.scannerSession = [[MSAutoScannerSession alloc] initWithScanner:_scannerSingleton.scanner];
    
    [_scannerSingleton.scanner openWithPath:path key:MS_API_KEY secret:MS_API_SECRET error:nil];
    
    // Create the progression and completion blocks:
    void (^completionBlock)(MSSync *, NSError *) = ^(MSSync *op, NSError *error) {
        if (error)
            NSLog(@"Sync failed with error: %@", [error ms_message]);
        else
            NSLog(@"Sync succeeded (%li images(s))", (long)[_scannerSingleton.scanner count:nil]);
    };
    
    void (^progressionBlock)(NSInteger) = ^(NSInteger percent) {
        NSLog(@"Sync progressing: %li%%", (long)percent);
        
    };
    
    // Launch the synchronization
    [_scannerSingleton.scanner syncInBackgroundWithBlock:completionBlock progressBlock:progressionBlock];
    
    [_scannerSingleton.scannerSession startRunning];
}


-(void)initializeParse
{

    // Initialize Parse.
    [Parse setApplicationId:@"wu9LPxjTgbejpFTsa9r0kNLSmyGCj0Jjv7mvyHTW"
                  clientKey:@"g7livpr9I3BnV2brHQJ0oxiKDPzx3RERAr0IBpCz"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:nil];

   
}
@end
