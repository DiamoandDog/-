//
//  ScanHistoryViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ScanHistoryViewController.h"

@interface ScanHistoryViewController ()

@end

@implementation ScanHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];

    [self _customNavigationBarButtonItems];
    
    [self _createViews];
}

#pragma mark -
#pragma mark Custom NavigationBarButtonItems
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBarButtonItems
{
    self.title = @"浏览历史";
    
    //|-----------------------------------------------------------------------------------
    //!Add rightBarButtonItem
    UIButton *rightClearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightClearBtn.frame = CGRectMake(0, 0, 40, 40);
    rightClearBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    [rightClearBtn setTitle:@"清空" forState:UIControlStateNormal];
    
    [rightClearBtn addTarget:self action:@selector(rightClearBtn:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightCleatBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightClearBtn];
    
    self.navigationItem.rightBarButtonItem = rightCleatBtnItem;
}

- (void)rightClearBtn:(UIButton *)btn
{
    NSLog(@"清空了");
}

- (void)_createViews
{
    //TipView
    UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    
     tipView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1.0];
    
    [self.view addSubview:tipView];
    
    
    //TipImageView
    UIImageView *tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tishi@2x"]];
    
    tipImageView.frame = CGRectMake(10, 7.5, 30, 25);
    
    tipImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [tipView addSubview:tipImageView];

    
    //TipLable
    UILabel *tipLable = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, tipView.width - 30, 30)];
    
    tipLable.text = [NSString stringWithFormat: @"你最近浏览过的%li车系，最多可以保存50组",                     [_scanCount integerValue]];
    
    tipLable.textColor = [UIColor grayColor];
    tipLable.font = [UIFont systemFontOfSize:14];
    tipLable.numberOfLines = 0;
    
    [tipView addSubview:tipLable];
    
    
    //| ----------------------------------------------------------------------------------
    subTableView = [[ScanHistoryTableView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight)];
    
    subTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self.view addSubview:subTableView];
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
