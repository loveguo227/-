//
//  DFTabBar.h
//  网易彩票
//
//  Created by FEI on 16/2/16.
//  Copyright © 2016年 FEI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DFTabBar;
@protocol DFTabBarDelegate <NSObject>
@optional
-(void)tabBar:(DFTabBar *)tabBar didSelectItem:(NSInteger)index;

@end
@interface DFTabBar : UIView
@property(nonatomic,weak) id<DFTabBarDelegate> delegate;
//创建按钮
-(void)setupTabBarButtonWithNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;
@end
