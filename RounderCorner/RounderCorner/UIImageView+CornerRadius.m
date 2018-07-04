//
//  UIImageView+CornerRadius.m
//  RounderCorner
//
//  Created by ChanLiang on 2018/7/4.
//  Copyright © 2018 Gho5t. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import "UIImage+CornerRadius.h"

@implementation UIImageView (CornerRadius)

- (void)gt_drawCornerRadius:(CGFloat)radius{    
    if (self.image) {
        self.image = [self.image gt_drawCornerRadius:radius sizeToFit:self.bounds.size];
    }
}

- (void)gt_setImage:(UIImage *)image drawCornerRadius:(CGFloat)radius{
    __weak typeof(self) weakSelf = self;
    CGSize size = self.bounds.size;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        UIImage *output = [image gt_drawCornerRadius:radius sizeToFit:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.image = output;
        });
    });
}


@end
