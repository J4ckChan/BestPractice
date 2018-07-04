//
//  UIImage+CornerRadius.m
//  RounderCorner
//
//  Created by ChanLiang on 2018/7/4.
//  Copyright © 2018 Gho5t. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

- (UIImage *)gt_drawCornerRadius:(CGFloat)radius sizeToFit:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath;
    CGContextAddPath(UIGraphicsGetCurrentContext(),path);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
