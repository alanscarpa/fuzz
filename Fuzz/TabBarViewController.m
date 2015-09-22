//
//  TabBarViewController.m
//  Fuzz
//
//  Created by Alan Scarpa on 9/22/15.
//  Copyright © 2015 Moodstocks. All rights reserved.
//

#import "TabBarViewController.h"
#import "UIImage+Overlay.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
}

-(void)setUpUI
{
   [self setTabBarIcons];
}



-(void)setTabBarIcons
{
   
    UIImage *bgImage = [UIImage makeImageWithColor:[UIColor colorWithRed:229/255.0f green:68/255.0f blue:0/255.0f alpha:1] andSize:CGSizeMake(self.tabBar.frame.size.width/[self.tabBar.items count], self.tabBar.frame.size.height)];
    [[UITabBar appearance] setSelectionIndicatorImage:bgImage];


    // set color of selected text
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    // set color of selected icons
    self.tabBar.tintColor = [UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1.0f];

    
    // set color of unselected text
     UIColor * unselectedColor = [UIColor colorWithRed:255/255.0f green:171/255.0f blue:135/255.0f alpha:1.0f];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:unselectedColor, NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    
    

    
    

    UIImage *scanIcon = [[UIImage imageNamed:@"scanIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *feedIcon = [UIImage imageNamed:@"feedIcon"];
    UIImage *rewardsIcon = [UIImage imageNamed:@"rewardsIcon"];
    
    self.viewControllers[0].tabBarItem.image = [self imageWithImage:feedIcon scaledToSize:CGSizeMake(28, 28)];
    self.viewControllers[1].tabBarItem.image = [self imageWithImage:scanIcon scaledToSize:CGSizeMake(28, 28)];
    self.viewControllers[2].tabBarItem.image = [self imageWithImage:rewardsIcon scaledToSize:CGSizeMake(28, 28)];
    
    
    
    
    // generate a tinted unselected image based on image passed via the storyboard
    for(UITabBarItem *item in self.tabBar.items) {
        // use the UIImage category code for the imageWithColor: method
        item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
