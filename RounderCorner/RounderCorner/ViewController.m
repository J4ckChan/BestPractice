//
//  ViewController.m
//  RounderCorner
//
//  Created by ChanLiang on 2018/7/4.
//  Copyright © 2018 Gho5t. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+CornerRadius.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.imageView gt_setImage:[UIImage imageNamed:@"Sample"] drawCornerRadius:15.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
