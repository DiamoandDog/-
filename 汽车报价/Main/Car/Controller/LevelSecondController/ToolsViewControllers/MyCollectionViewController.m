//
//  MyCollectionViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "CustomNetworkRequest.h"
//modle
#import "FavSeriesModel.h"
#import "FavSpecModel.h"
#import "FavDealerModel.h"

@interface MyCollectionViewController ()
{
    UISegmentedControl *_segmentChange;
}
@end

@implementation MyCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1.0];
    
    [self _customNavigationBar];
    
    [self _createViews];
    
    [self _loadNetworkData];
}



- (void)_loadNetworkData
{
    _tableView.flag = _segmentChange.selectedSegmentIndex;

    if (_segmentChange.selectedSegmentIndex == 0) {
        
        //userID	351758051124178
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params setValue:@"351758051124178" forKey:@"userID"];
        
        [CustomNetworkRequest requestWithURL:KMyCollectionFavSerisesURL params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
            
            NSDictionary *resultDic= result[@"result"];
            
            _myCollectionModelArray = [NSMutableArray array];
            
            for (NSDictionary *dic in resultDic[@"serieslist"]) {
                
                FavSeriesModel *model = [[FavSeriesModel alloc] initModelDataWithJsonDic:dic];
                
                [_myCollectionModelArray addObject:model];
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _tableView.myColletionTableModelArray = _myCollectionModelArray;
                
            });
            
        }];
        
    }else if (_segmentChange.selectedSegmentIndex == 1)
        
    {
        /*userID	351758051124178
         cityID	331000
         provinceID	330000*/

        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params setValue:@"351758051124178" forKey:@"userID"];
        [params setValue:@"331000" forKey:@"cityID"];
        [params setValue:@"330000" forKey:@"provinceID"];

        
        [CustomNetworkRequest requestWithURL:KMyCollectionFavSpecURL params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
            
            NSDictionary *resultDic= result[@"result"];
            NSArray *array = resultDic[@"serieslist"];
            
            _myCollectionModelArray = [NSMutableArray array];
            
            for (NSDictionary *dic in array) {
                
                
                FavSpecModel *model = [[FavSpecModel alloc] initWithDictionary:dic];
                [_myCollectionModelArray addObject:model];

            }
            
            
        
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _tableView.myColletionTableModelArray = _myCollectionModelArray;
                
            });
            
        }];

    }else if (_segmentChange.selectedSegmentIndex == 2)
    {
        //userID	351758051124178
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params setValue:@"351758051124178" forKey:@"userID"];
        
        [CustomNetworkRequest requestWithURL:KMyCollectionFavDealerURL params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
            
            NSDictionary *resultDic= result[@"result"];
            
            _myCollectionModelArray = [NSMutableArray array];
            
            for (NSDictionary *dic in resultDic[@"dealerlist"]) {
                
                FavDealerModel *model = [[FavDealerModel alloc] initModelDataWithJsonDic:dic];
                
                [_myCollectionModelArray addObject:model];
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _tableView.myColletionTableModelArray = _myCollectionModelArray;
                
            });
            
        }];


    }
    
    
    

    
    
}

#pragma mark -
#pragma mark Custom NavigationBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar
{
    self.title = @"我的收藏";
    
    //|-----------------------------------------------------------------------------------
    //!Add rightBarButtonItem
    UIButton *rightAddBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightAddBtn.frame = CGRectMake(0, 0, 40, 40);
    
    rightAddBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    [rightAddBtn setImage:[UIImage imageNamed:@"jia@2x"] forState:UIControlStateNormal];
    
    [rightAddBtn addTarget:self action:@selector(rightAddBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightAddBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightAddBtn];
    
    self.navigationItem.rightBarButtonItem = rightAddBtnItem;
    

}


- (void)rightAddBtn
{
    NSLog(@"已收藏");
    
}

#pragma mark -
#pragma mark 
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    //|-----------------------------------------------------------------------------------
    //!subview one

    _segmentChange = [[UISegmentedControl alloc] initWithItems:@[@"车系",@"车型",@"经销商"]];
    
    _segmentChange.frame = CGRectMake(0, 0, KScreenWidth, 40);
    _segmentChange.tintColor = [UIColor orangeColor];
    _segmentChange.selectedSegmentIndex = 0;
    
    
    [_segmentChange addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segmentChange];
    
    //|-----------------------------------------------------------------------------------
    //!subview two

    _tableView = [[MyColletionTableView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    
    
    
    
    
    [self.view addSubview:_tableView];
    
    
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
