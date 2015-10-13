#import "ScannerViewController.h"
#import "ScannerSingleton.h"

static int kMSResultTypes = MSResultTypeImage  |
                            MSResultTypeQRCode |
                            MSResultTypeEAN13;


@interface ScannerViewController () <MSAutoScannerSessionDelegate>

@property (weak, nonatomic) IBOutlet UIView *scanBounds;
@property (strong, nonatomic) IBOutlet UIView *videoPreview;
@property (weak, nonatomic) IBOutlet UIButton *notScanningButton;

@end


@implementation ScannerViewController {
    ScannerSingleton *_scannerSingleton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _scannerSingleton = [ScannerSingleton init];
    [self setUpUI];
    [self initializeScanner];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setUpUI {
    [self setUpScannerOverlay];
    self.notScanningButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.notScanningButton.titleLabel.minimumScaleFactor = 0.7;
    self.notScanningButton.titleLabel.textAlignment = NSTextAlignmentCenter;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)setUpScannerOverlay {
    self.scanBounds.backgroundColor = [UIColor clearColor];
    self.scanBounds.layer.borderWidth = 3.0f;
    self.scanBounds.layer.borderColor = [UIColor colorWithRed:229/255.0f green:68/255.0f blue:0/255.0f alpha:1].CGColor;
}

-(void)initializeScanner {
    _scannerSingleton.scannerSession.delegate = self;
    _scannerSingleton.scannerSession.resultTypes = kMSResultTypes;

    CALayer *videoPreviewLayer = [self.videoPreview layer];
    [videoPreviewLayer setMasksToBounds:YES];
    
    CALayer *captureLayer = [_scannerSingleton.scannerSession captureLayer];
    [captureLayer setFrame:[self.videoPreview bounds]];
    
    [videoPreviewLayer insertSublayer:captureLayer
                                below:[[videoPreviewLayer sublayers] objectAtIndex:0]];

}

#pragma mark - MSAutoScannerSessionDelegate

- (void)session:(id)scannerSession didFindResult:(MSResult *)result {
    NSString *type = [result type] == MSResultTypeImage ? @"Image" : @"Barcode";
    NSString *message = [NSString stringWithFormat:@"%@", [result string]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:type message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [_scannerSingleton.scannerSession resumeProcessing];
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dealloc {
    [_scannerSingleton.scannerSession stopRunning];
}

@end
