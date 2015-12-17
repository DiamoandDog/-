//
//  SaleListViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SaleListViewController.h"
#import "SaleListSectionModel.h"
#import "CustomNetworkRequest.h"


@interface SaleListViewController ()
{
    UISegmentedControl *segment;
}
@end

@implementation SaleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"销售排行";
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    [self _createViews];
    
    [self _loadNetworkData];
    
    [self _pullDownOrUpLoadData];

}

#pragma mark -
#pragma mark Refresh Loading Data by pulling down ,up ,touch(point or view)
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_pullDownOrUpLoadData
{
    __weak SaleListViewController *weakSelf = self;
    
    
    [self.currentTableView setPullDownBlock:^{
        
        
        [weakSelf _loadNetworkData];
        
        
    }];
    
    [self.currentTableView  setPullUpBlock:^{
        
        
        
        [weakSelf _loadNetworkData];
        
        
    }];
    
    [self.currentTableView setTouchTableViewBlock:^{
        
        
        [weakSelf showLoadingView];
        
        [weakSelf _loadNetworkData];
        
    }];
}






#pragma mark -
#pragma mark Loading data from network by reqeust
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_loadNetworkData
{
    
    NSParameterAssert(segment.selectedSegmentIndex >= 0 && segment.selectedSegmentIndex <= 3);
    
    NSInteger type = segment.selectedSegmentIndex + 1;
    
    NSDictionary * params = @{ @"type":[NSNumber numberWithInteger:type]
                               
                              };
    
    [CustomNetworkRequest requestWithURL:KSaleListURL params:(NSMutableDictionary *)params httpMethod:@"GET" requestHeader:nil block:^(id result) {
        
        NSDictionary *resultDic = result[@"result"];
        _currentModelArray = [NSMutableArray array];
        
        for (NSDictionary *dic in resultDic[@"hotcarlist"]) {
            
            SaleListSectionModel *model = [[SaleListSectionModel alloc] initWithDictionary:dic];
            
            [_currentModelArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _currentTableView.tableModelArray = _currentModelArray;

            
        });

        

    }];
    
    
    

}

#pragma mark -
#pragma mark 
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    //|-----------------------------------------------------------------------------------
    //!Add UISegmentControl View

    segment = [[UISegmentedControl alloc] initWithItems:@[@"热门",@"豪车",@"SUV",@"其他"]];
    
    segment.frame = CGRectMake(0, 0, KScreenWidth, 40);
    segment.tintColor = [UIColor orangeColor];
    segment.selectedSegmentIndex = 0;
    
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
    
    _currentTableView = [[SaleListTableView alloc] initWithFrame:CGRectMake(0, segment.height, KScreenWidth, KScreenHeight - 40)];
    
    [self.view addSubview:_currentTableView];
 
}

- (void)segmentAction:(UISegmentedControl *)segment
{
    //NSLog(@"点击了");//test😊😊😊😊😊test😊😊😊😊😊test
    [self _loadNetworkData];
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
