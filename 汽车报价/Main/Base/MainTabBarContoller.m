//
//  MainTabBarContoller.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "MainTabBarContoller.h"
#import "BaseNavigationController.h"
#import "CustomButton.h"

@interface MainTabBarContoller ()
{
    CustomButton *_lastBtn;    // Using for record the last click btn

}
@end

@implementation MainTabBarContoller


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建子控制器
    [self _createViewControllers];
    

    
    // 2.自定义TabBarButtons
    [self _removeSystemTabBarBtns];

    [self _createCustomTabBarBtns];
    
}


#pragma mark -
#pragma mark CreateViewControllers
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViewControllers
{
    
    NSArray *storyboardNames = @[@"Car",@"Search",@"Tool",@"Sale",@"More"];
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    for (int i=0; i<storyboardNames.count; i++) {
        
        NSString *name = storyboardNames[i];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        BaseNavigationController *navi = [storyboard instantiateInitialViewController];
        [viewControllers addObject:navi];
    }
    
    self.viewControllers = viewControllers;
}



#pragma mark -
#pragma mark CustomTabBarButtons
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_removeSystemTabBarBtns
{
    // 移除tabBar 上面内部创建的按钮子视图
    for (UIView *btnView in self.tabBar.subviews)
    {
        Class cla = NSClassFromString(@"UITabBarButton");
        if ([btnView isKindOfClass:cla] )
        {
            [btnView removeFromSuperview];
        }
    }
    
}

- (void)_createCustomTabBarBtns
{
    // 1.Set the backgroundImageView of buttons in tabBar
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KTableBarHeight)];
    
    bgImgView.image = [UIImage imageNamed:@"im_tabbg@2x"];
    [self.tabBar addSubview:bgImgView];
    

    // 2. Set title and iamgeView for custom button
     NSArray *normalImageNames = @[
                            @"tab_car@2x",
                            @"tab_Search@2x",
                            @"tab_tools@2x",
                            @"tab_sale@2x",
                            @"tab_more@2x"
                            ];
    
    NSArray *highLightImageNames = @[
                            @"tab_car_b@2x",
                            @"tab_Search_b@2x",
                            @"tab_tools_b@2x",
                            @"tab_sale_b@2x",
                            @"tab_more_b@2x"
                            ];

    
    NSArray *titles = @[@"车型",
                        @"找车",
                        @"工具",
                        @"降价",
                        @"更多"
                        ];
    
    
    CGFloat width       = KScreenWidth / titles.count;
    CGFloat height      = KTableBarHeight;
    
    for (int i = 0; i < normalImageNames.count; i++)
    {
        
       CustomButton  *btn = [[CustomButton alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        
        btn.tag = i +100;
        
        if (i == 0) {
            
            btn.isSelected = YES;
        }
        
        btn.layoutStyle = TopImageBottomLableVerticalLayout;
        btn.titleLabel.text = titles[i];
        btn.normalImageName = normalImageNames[i];
        btn.highLightImageName = highLightImageNames[i];
        
        btn.normalTitleColor = [UIColor darkGrayColor];
        btn.highLightTitleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"anniu@2x"]];
        
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:btn];
        
    }
    
}

#pragma mark -
#pragma mark - The events of clicking button
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)btnAction:(CustomButton *)btn
{
    
    NSParameterAssert(btn.tag >= 100 && btn.tag <= 104);
    
    if (btn != _lastBtn) {
        
        if (btn.tag != 100 ) {
            
            CustomButton * firstBtn = (CustomButton *)[self.tabBar viewWithTag:100];
            firstBtn.isSelected = NO;
            btn.isSelected = !btn.isSelected;


        }else
        {
            btn.isSelected = YES;
        }
        
        _lastBtn.isSelected = NO;
        _lastBtn = btn;

        
        // 切换控制器
        self.selectedIndex = btn.tag - 100;
    }
    
    
}


@end














