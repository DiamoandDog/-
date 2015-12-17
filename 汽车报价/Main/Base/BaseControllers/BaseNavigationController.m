//
//  BaseNavigationController.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _customNavigationBar];
    
    
    
    
}


#pragma mark -
#pragma mark Private methods
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar
{
    
    //|-----------------------------------------------------------------------------------
    //!Set default properties of BaseNavigation Bar
    
    self.navigationBar.translucent = NO;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    UIImage *naviBgimage = [UIImage imageNamed:@"naviBarbgImage@2x"];
    
    [self.navigationBar setBackgroundImage:naviBgimage forBarMetrics:UIBarMetricsDefault];
    
 
}



@end





















