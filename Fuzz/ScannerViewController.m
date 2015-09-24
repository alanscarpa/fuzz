#import "ScannerViewController.h"
#import "Constants.h"
#import "SVProgressHUD.h"

static int kMSResultTypes = MSResultTypeImage  |
                            MSResultTypeQRCode |
                            MSResultTypeEAN13;


@interface ScannerViewController () <MSAutoScannerSessionDelegate>

@property (weak, nonatomic) IBOutlet UIView *scanBounds;
@property (strong, nonatomic) IBOutlet UIView *videoPreview;
@property (weak, nonatomic) IBOutlet UIButton *notScanningButton;

@end


@implementation ScannerViewController {
    MSAutoScannerSession *_scannerSession;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [SVProgressHUD show];
    
    [self setUpUI];
    [self initializeScanner];


}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)setUpUI
{
    
    [self setUpScannerOverlay];
    self.notScanningButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.notScanningButton.titleLabel.minimumScaleFactor = 0.7;
    self.notScanningButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)setUpScannerOverlay
{
    self.scanBounds.backgroundColor = [UIColor clearColor];
    self.scanBounds.layer.borderWidth = 3.0f;
    self.scanBounds.layer.borderColor = [UIColor colorWithRed:229/255.0f green:68/255.0f blue:0/255.0f alpha:1].CGColor;
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
            [SVProgressHUD dismiss];
        
    };
    
    void (^progressionBlock)(NSInteger) = ^(NSInteger percent) {
        NSLog(@"Sync progressing: %li%%", (long)percent);
        
    };
    
    // Launch the synchronization
    [_scanner syncInBackgroundWithBlock:completionBlock progressBlock:progressionBlock];
    self.scanner = _scanner;
    
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

#pragma mark - MSAutoScannerSessionDelegate

- (void)session:(id)scannerSession didFindResult:(MSResult *)result
{
    
    NSString *type = [result type] == MSResultTypeImage ? @"Image" : @"Barcode";
    NSString *message = [NSString stringWithFormat:@"%@", [result string]];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:type message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [_scannerSession resumeProcessing];
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [_scannerSession stopRunning];
}







@end
