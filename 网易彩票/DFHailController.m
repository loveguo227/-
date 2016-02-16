//
//  DFHailController.m
//  网易彩票
//
//  Created by FEI on 16/2/16.
//  Copyright © 2016年 FEI. All rights reserved.
//

#import "DFHailController.h"

@interface DFHailController ()

@end

@implementation DFHailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * imageButton = [[UIButton alloc] init];
    [imageButton setBackgroundImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    imageButton.frame = CGRectMake(0, 0, imageButton.currentBackgroundImage.size.width, imageButton.currentBackgroundImage.size.height);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageButton];
}

@end
