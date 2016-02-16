//
//  DFTabBarController.m
//  网易彩票
//
//  Created by FEI on 16/2/16.
//  Copyright © 2016年 FEI. All rights reserved.
//

#import "DFTabBarController.h"
#import "DFTabBar.h"
@interface DFTabBarController ()<DFTabBarDelegate>

@end

@implementation DFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    DFTabBar * tabBar = [[DFTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.frame = self.tabBar.bounds;
    for (NSInteger index = 0; index<self.viewControllers.count; index++) {
        NSString * normalImageName = [NSString stringWithFormat:@"TabBar%zd",index+1];
        NSString * selectedImageName = [NSString stringWithFormat:@"TabBar%zdSel",index+1];
        [tabBar setupTabBarButtonWithNormalImage:normalImageName selectedImage:selectedImageName];
    }
    [self.tabBar addSubview:tabBar];
    
    //设置导航条背景  全局导航条
    UINavigationBar * navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor whiteColor];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题属性
    NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:attributes];
    
    //获得全局UIBarButtonItem
    NSMutableDictionary * itemAttributes = [NSMutableDictionary dictionary];
    itemAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [navBar setTitleTextAttributes:attributes];
    
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:itemAttributes forState:UIControlStateNormal];
}

#pragma mark - 代理方法
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(NSInteger)index
{
    self.selectedViewController = self.viewControllers[index];
}

@end
