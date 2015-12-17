//
//  DealerHomeViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "DealerHomeViewController.h"
#import "CustomNetworkRequest.h"

@interface DealerHomeViewController ()

@end

@implementation DealerHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self _customNavigationBar];
    [self _crateViews];
    [self _laodNetworkData];
    
    
    
}



#pragma mark -
#pragma mark Custom NavigationBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar
{
    self.title = @"经销商主页";
}
     
#pragma mark -
#pragma mark Loading networking data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_laodNetworkData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [CustomNetworkRequest requestWithURL:KDealerHomePageURL params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
        
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            subViewTableView.dealerHomeTableModelArray = _dealeHomePageModelArray;
        });

        
    }];
    
    
}
     


#pragma mark -
#pragma mark CreateViews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_crateViews
{
    subViewTableView = [[DealerHomeTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    
    [self.view addSubview:subViewTableView];
    
    
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
