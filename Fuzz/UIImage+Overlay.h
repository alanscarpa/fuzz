//
//  UIImage+Overlay.h
//  Fuzz
//
//  Created by Alan Scarpa on 9/22/15.
//  Copyright © 2015 Moodstocks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Overlay)

- (UIImage *)imageWithColor:(UIColor *)color1;
+ (UIImage *)makeImageWithColor:(UIColor*)color andSize:(CGSize)size;
@end
