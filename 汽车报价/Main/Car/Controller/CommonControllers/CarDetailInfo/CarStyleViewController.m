//
//  CarStyleViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarStyleViewController.h"

@interface CarStyleViewController ()

@end

@implementation CarStyleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor]; //[UIColor colorWithWhite:0.9 alpha:1.0];
    

}

#pragma mark -
#pragma mark Custom NavigatonBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar:(BOOL)hidden
{
    if (hidden) {
        
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        UIImage *naviBgimage = [UIImage imageNamed:@"naviBarbgImage@2x"];
        
        [self.navigationController.navigationBar setBackgroundImage:naviBgimage forBarMetrics:UIBarMetricsDefault];
        
        
    }
    else
    {
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
        
    }
    
}


#pragma mark -
#pragma mark Hidden tableBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _customNavigationBar:NO];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self _customNavigationBar:YES];
    
    self.tabBarController.tabBar.hidden = NO;
}

@end
