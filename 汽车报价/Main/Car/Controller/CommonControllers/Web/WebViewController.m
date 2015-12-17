//
//  WebViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "WebViewController.h"
#import "BaseNavigationController.h"

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self showLoadingView];

    self.view.backgroundColor = [UIColor grayColor];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_webUrl]
];
    
    [web loadRequest:request];
    
    [self.view addSubview:web];
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
