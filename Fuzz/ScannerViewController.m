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

#import "ScannerViewController.h"
#import "Constants.h"

static int kMSResultTypes = MSResultTypeImage  |
                            MSResultTypeQRCode |
                            MSResultTypeEAN13;


@interface ScannerViewController () <MSAutoScannerSessionDelegate>

@property (weak, nonatomic) IBOutlet UIView *scanBounds;
@property (strong, nonatomic) IBOutlet UIView *videoPreview;

@end

@implementation ScannerViewController {
    MSAutoScannerSession *_scannerSession;
}


- (void)dealloc
{
    [_scannerSession stopRunning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    
    
    self.scanBounds.backgroundColor = [UIColor clearColor];
    self.scanBounds.layer.borderWidth = 3.0f;
    self.scanBounds.layer.borderColor = [UIColor colorWithRed:229/255.0f green:68/255.0f blue:0/255.0f alpha:1].CGColor;
    
    [self initializeScanner];
    _scannerSession = [[MSAutoScannerSession alloc] initWithScanner:_scanner];
    _scannerSession.delegate = self;
    _scannerSession.resultTypes = kMSResultTypes;
    
    CALayer *videoPreviewLayer = [self.videoPreview layer];
    [videoPreviewLayer setMasksToBounds:YES];
    
    CALayer *captureLayer = [_scannerSession captureLayer];
    [captureLayer setFrame:[self.videoPreview bounds]];
    
    [videoPreviewLayer insertSublayer:captureLayer
                                below:[[videoPreviewLayer sublayers] objectAtIndex:0]];
    
    [_scannerSession startRunning];
}




-(void)initializeScanner
{
    NSString *path = [MSScanner cachesPathFor:@"scanner.db"];
    _scanner = [[MSScanner alloc] init];
    [_scanner openWithPath:path key:MS_API_KEY secret:MS_API_SECRET error:nil];
    
    // Create the progression and completion blocks:
    void (^completionBlock)(MSSync *, NSError *) = ^(MSSync *op, NSError *error) {
        if (error)
            NSLog(@"Sync failed with error: %@", [error ms_message]);
        else
            NSLog(@"Sync succeeded (%li images(s))", (long)[_scanner count:nil]);
    };
    
    void (^progressionBlock)(NSInteger) = ^(NSInteger percent) {
        NSLog(@"Sync progressing: %li%%", (long)percent);
    };
    
    // Launch the synchronization
    [_scanner syncInBackgroundWithBlock:completionBlock progressBlock:progressionBlock];
    self.scanner = _scanner;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MSAutoScannerSessionDelegate

- (void)session:(id)scannerSession didFindResult:(MSResult *)result
{
    NSString *title = [result type] == MSResultTypeImage ? @"Image" : @"Barcode";
    NSString *message = [NSString stringWithFormat:@"%@:\n%@", title, [result string]];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
         [_scannerSession resumeProcessing];
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}





@end
