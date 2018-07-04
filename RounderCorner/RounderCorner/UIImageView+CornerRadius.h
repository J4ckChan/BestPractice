//
//  UIImageView+CornerRadius.h
//  RounderCorner
//
//  Created by ChanLiang on 2018/7/4.
//  Copyright © 2018 Gho5t. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CornerRadius)

- (void)gt_drawCornerRadius:(CGFloat)radius;
- (void)gt_setImage:(UIImage *)image drawCornerRadius:(CGFloat)radius;

@end
