//
//  DFTabBar.m
//  网易彩票
//
//  Created by FEI on 16/2/16.
//  Copyright © 2016年 FEI. All rights reserved.
//

#import "DFTabBar.h"
#import "DFTabBarButton.h"

@interface DFTabBar ()
@property (nonatomic,weak) DFTabBarButton * selectedBtn;
@end
@implementation DFTabBar
-(void)setupTabBarButtonWithNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    DFTabBarButton * tabBarButton = [[DFTabBarButton alloc] init];
    //设置普通状态和选中状态显示图片
    [tabBarButton setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [tabBarButton setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    //按钮点击
    [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    tabBarButton.tag = self.subviews.count;
    [self addSubview:tabBarButton];
    if (self.subviews.count == 1) {
        [self tabBarButtonClick:tabBarButton];
    }
}

//按钮点击事件
-(void)tabBarButtonClick:(DFTabBarButton *)tabBarButton
{
    self.selectedBtn.selected = NO;
    self.selectedBtn = tabBarButton;
    self.selectedBtn.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItem:)]) {
        [self.delegate tabBar:self didSelectItem:tabBarButton.tag];
    }
}

//布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    
    CGFloat buttonW = self.frame.size.width/count;
    CGFloat buttonH = self.frame.size.height;
    
    for (NSInteger index = 0; index < count; index++) {
        UIButton * tabBarButton = self.subviews[index];
        CGFloat buttonX = buttonW*index;
        CGFloat buttonY = 0;
        
        tabBarButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
@end
