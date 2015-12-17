//
//  NearbyDealerViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NearbyDealerViewController.h"
#import "NearByMapViewController.h"
#import "CustomNetworkRequest.h"

#import "NearByDealerModel.h"

@interface NearbyDealerViewController ()

@end

@implementation NearbyDealerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1.0];
    
    [self _loadNetworkData];
    
    [self _customNavigationBarButtomItems];
    
    [self _createViews];
    
}



#pragma mark -
#pragma mark Loading data from network request
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_loadNetworkData
{
    //|-----------------------------------------------------------------------------------
    //! 暂时传 死参数， 后面有时间再弄
    //Need parameters is pageIndex, pageSize, order,Loacation(latitude,longitude)
    /*provinceId	0
    cityId	0
    countyId	0
    brandId	0
    factoryId	0
    seriesId	0
    pageIndex	3
    pageSize	10
    order	1
    lat	30.321297
    lon	120.343943*/
    NSDictionary *params = @{
                             @"pageIndx":@1,
                             @"pageSize":@20,
                             @"order":@1,
                             @"lat":@30.321279,
                             @"lon":@120.343943
                             };
    
    [CustomNetworkRequest requestWithURL:KDealerOrderList params:(NSMutableDictionary *)params httpMethod:@"GET" requestHeader:nil block:^(id result) {
        
        _dealerModelArray = [NSMutableArray array];
        
        NSDictionary *resultDic = result[@"result"];
        
        
        NearByDealerModel *model = [[NearByDealerModel alloc] initWithDictionary:resultDic];
        
        [_dealerModelArray addObject:model];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _dealerTableView.dealerTableViewArray = _dealerModelArray;
            
        });

    }];
    
    

    
}




#pragma mark -
#pragma mark 
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBarButtomItems
{
    self.title = @"附近经销商";
    
    //|-----------------------------------------------------------------------------------
    //!Custom rightBarButtomItems
    UIButton *rightFirstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightFirstBtn.frame = CGRectMake(0, 0, 40, 40);
    
    rightFirstBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    [rightFirstBtn setImage:[UIImage imageNamed:@"location@3x"] forState:UIControlStateNormal];
    
    [rightFirstBtn addTarget:self action:@selector(rightFirstBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightFirstBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightFirstBtn];
    
    //
    UIButton *rightSecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightSecondBtn.frame = CGRectMake(0, 0, 40, 40);
    
    rightSecondBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
    [rightSecondBtn setImage:[UIImage imageNamed:@"downgo_white"] forState:UIControlStateNormal];
    
    [rightSecondBtn addTarget:self action:@selector(rightSecondBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightSecondBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightSecondBtn];
    
    
    self.navigationItem.rightBarButtonItems = @[rightFirstBtnItem, rightSecondBtnItem];

    
}


- (void)rightFirstBtn
{
    NearByMapViewController *nearByMap = [[NearByMapViewController alloc] init];
    
    [self.navigationController pushViewController:nearByMap animated:YES];
    
}

- (void)rightSecondBtn
{
    
}


#pragma mark -
#pragma mark
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    _dealerTableView = [[NearByDealerTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    [self.view addSubview:_dealerTableView];
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
