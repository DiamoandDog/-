//
//  NewCarsMarketViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NewCarsMarketViewController.h"
#import "NewCarMarketModel.h"
#import "CustomNetworkRequest.h"


@interface NewCarsMarketViewController ()
{
    UISegmentedControl *_segment;
    
   NSInteger pageIndex;
    
}
@end

@implementation NewCarsMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _laodNetworkData];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    [self _customNavigationBarButtoms];
    
    [self _createViews];
    
    [self _pullDownOrUpLoadData];

}

#pragma mark -
#pragma mark Refresh Loading Data by pulling down ,up ,touch(point or view)
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_pullDownOrUpLoadData
{
    __weak NewCarsMarketViewController *weakSelf = self;
    
    
    [self.currentTableView setPullDownBlock:^{
        
        pageIndex = 1;
        
        [weakSelf _laodNetworkData];
        
        
    }];
    
    [self.currentTableView  setPullUpBlock:^{
        
        pageIndex += 1; //????????😖😖😖😖😖😖😖😖😖😖????????

        
        [weakSelf _laodNetworkData];
        
        
    }];
    
    [self.currentTableView setTouchTableViewBlock:^{
        
        pageIndex += 1; //????????😖😖😖😖😖😖😖😖😖😖????????

        [weakSelf showLoadingView];
        
        [weakSelf _laodNetworkData];
        
    }];
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


#pragma mark -
#pragma mark Loading data from the network request
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_laodNetworkData
{
    
    _marketModleArray = [NSMutableArray array];
    //|-----------------------------------------------------------------------------------
    //!New Cars data request
    if (_segment.selectedSegmentIndex == 0) {
        

        NSDictionary *params = @{
                                 @"pageindex":[NSNumber numberWithInteger:pageIndex],
                                 @"pagesize":@20
                                 
                                 };
        
        [CustomNetworkRequest requestWithURL:KNewCarsURL params:(NSMutableDictionary *)params httpMethod:@"GET" requestHeader:nil block:^(id result) {
            
            NSDictionary *resultDic = result[@"result"];
            for (NSDictionary *dic in resultDic[@"serieslist"]) {
                
                NewCarMarketModel *model = [[NewCarMarketModel alloc] initModelDataWithJsonDic:dic];
                
                [_marketModleArray addObject:model];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _currentTableView.marketTableModelArray = _marketModleArray;
                
            });


            
        }  ];
    }
    
    
    //|-----------------------------------------------------------------------------------
    //!UpComingSales data request
    if (_segment.selectedSegmentIndex == 1) {
        

        
        [CustomNetworkRequest requestWithURL:KUpComingSalesURL params:nil httpMethod:@"GET" requestHeader:nil block:^(id result) {
            
            NSDictionary *resultDic = result[@"result"];
            for (NSDictionary *dic in resultDic[@"serieslist"]) {
                
                NewCarMarketModel *model = [[NewCarMarketModel alloc] initModelDataWithJsonDic:dic];
                
                [_marketModleArray addObject:model];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _currentTableView.marketTableModelArray = _marketModleArray;

            });


            
        }  ];
        
    }


    
    
}
     


#pragma mark -
#pragma mark Custom NavigationBarButtonItems
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBarButtoms
{
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"新车上市",@"即将销售"]];
    
    _segment.frame = CGRectMake(0, 0, 150, 30);
    _segment.tintColor = [UIColor whiteColor];
    _segment.selectedSegmentIndex = 0;
    
    [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = _segment;
}


- (void)segmentAction:(UISegmentedControl *)segement
{
    [self _laodNetworkData];
}


#pragma mark -
#pragma mark - Create Subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    _currentTableView = [[NewCarMarketTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight )];
    
    _currentTableView.backgroundColor = [UIColor colorWithWhite:0.89 alpha:1.0];
    
    [self.view addSubview:_currentTableView];
    
    
}

@end
