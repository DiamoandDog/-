//
//  SearchBarViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/7.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SearchBarViewController.h"

@interface SearchBarViewController ()

@end

@implementation SearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
}


#pragma mark -
#pragma mark Hidden tableBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}


@end
