//
//  UIImage+CornerRadius.h
//  RounderCorner
//
//  Created by ChanLiang on 2018/7/4.
//  Copyright © 2018 Gho5t. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CornerRadius)

- (UIImage *)gt_drawCornerRadius:(CGFloat)radius sizeToFit:(CGSize)size;

@end
