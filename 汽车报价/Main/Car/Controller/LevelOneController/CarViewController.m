//
//  CarViewController.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarViewController.h"

//Custom class
#import "CustomButton.h"
#import "CustomNetworkRequest.h"

//Cars model
#import "FocusListModel.h"
#import "HotBrandsModel.h"
#import "HotSeriesModel.h"
#import "BrandListSectionModel.h"

//push
#import "CitySelectedViewController.h"
#import "SearchBarViewController.h"


@interface CarViewController ()<UISearchBarDelegate>
{
    
}
@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self _laodNetworkData];
    
    [self _customNavigationBarItems];
    
    [self _createViews];
    

    
}

#pragma mark -
#pragma mark Load data from network
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_laodNetworkData
{
    //| ----------------------------------------------------------------------------------
    // Loading FocusListData
    [CustomNetworkRequest requestWithURL:KFocusURL
                                  params:nil
                              httpMethod:@"GET"
                           requestHeader:nil
                                   block:^(id result)
     {
         
         NSDictionary *resultDic = result[@"result"];
         NSDictionary *dic = resultDic[@"focusList"];
         _focusListModelArray = [NSMutableArray arrayWithCapacity:dic.count];
         
         for (NSDictionary *jsonDic in dic)
         {
             FocusListModel *model = [[FocusListModel alloc] initModelDataWithJsonDic:jsonDic];
             
             [_focusListModelArray addObject:model];
             
             
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             _carTableView.focusListTableModelArray = _focusListModelArray;
             
         });
         
     }];
    
    
    //| ---------------------------------------------------------------------------------------------
    //***********************************************************************************************
    [CustomNetworkRequest requestWithURL:KCarsURL
                                  params:nil
                              httpMethod:@"GET"
                           requestHeader:nil
                                   block:^(id result)
     {
         
         NSDictionary *resultDic = result[@"result"];
         
         //| ----------------------------------------------------------------------------------
         // Loading HotBrandsData
         NSDictionary *hotBrandList = resultDic[@"hotbrand"];
         
         _hotBrandsModelArray = [NSMutableArray array];
         for (NSDictionary *dic in hotBrandList[@"hotbrandlist"]) {
             
             HotBrandsModel *mode = [[HotBrandsModel alloc] initModelDataWithJsonDic:dic];
             
             [_hotBrandsModelArray addObject:mode];
             
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             _carTableView.hotBrandsTableModelArray = _hotBrandsModelArray;
             
         });
         
         
         
         
         //| ----------------------------------------------------------------------------------
         //! Loading HotSeriesData
         NSDictionary * hotseriesDic = resultDic[@"hotseries"];
         
         _hotSeriesModelArray = [NSMutableArray array];
         
         for (NSDictionary *dic in hotseriesDic) {
             
             HotSeriesModel *mode = [[HotSeriesModel alloc] initModelDataWithJsonDic:dic];
             
             [_hotSeriesModelArray addObject:mode];
             
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             _carTableView.hotSeriesTableModelArray = _hotSeriesModelArray;
             
         });
         
         
         
         //| ----------------------------------------------------------------------------------
         //! Loading BrandListData
         NSArray *brandLsitArray = resultDic[@"brandlist"];
         
         _brandListsectonModelArray = [NSMutableArray array];
         for (NSDictionary *dic in brandLsitArray)
         {
             
             BrandListSectionModel *model = [[BrandListSectionModel alloc] initWithDictionary:dic];
             
             [_brandListsectonModelArray addObject:model];
             
             
         }
         dispatch_async(dispatch_get_main_queue(), ^{
             
             _carTableView.brandListsectonTableModelArray = _brandListsectonModelArray;
             
         });
         
         
         
     }];
    
}

#pragma mark -
#pragma mark Custom Navigation leftBarButtomItems
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBarItems
{
    
    //| ----------------------------------------------------------------------------------
    //Add SearchBar
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 0, KScreenWidth - 20, KScreenHeight)];
    
    searchBar.barStyle = UIBarStyleBlackTranslucent ;
    searchBar.placeholder = @"搜车";
    searchBar.tintColor = [UIColor whiteColor];
    
    searchBar.delegate = self;
    
    
    
    self.navigationItem.titleView = searchBar;
    
    
    //| ----------------------------------------------------------------------------------
    //Custom leftbarButtonItem
    CustomButton *leftBtn = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    
    leftBtn.layoutStyle = LeftLableRightImageHorizontalLayout;
    
    leftBtn.normalImageName = @"downgo_white@2x";
    leftBtn.titleLabel.text = @"杭州";
    leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    leftBtn.titleLabel.textColor = [UIColor whiteColor];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    
    
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)leftBtnAction:(CustomButton *)btn
{
    CitySelectedViewController *selectedCity = [[CitySelectedViewController alloc] init];
    
    [self.navigationController pushViewController:selectedCity animated:YES];
}



#pragma mark -
#pragma mark Create subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    
    
    //| ----------------------------------------------------------------------------------
    // Create CartableView
    // You can modify the CartableView
    _carTableView = [[CarTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    _carTableView.backgroundColor = [UIColor  colorWithWhite:0.9 alpha:1.0];
    _carTableView.contentInset = UIEdgeInsetsMake(-0.75, 0, 0, 0);
    
    
    [self.view addSubview:_carTableView];
    
    
    //| ----------------------------------------------------------------------------------
    //! Create SecondView
    _secondView = [[SecondView alloc] initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth - 70, KScreenHeight)];
    _secondView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    [self.view addSubview:_secondView];
    
    //Add GestureRegconizer for _secondView
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeSecondView)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [_secondView addGestureRecognizer:swipe];
}

- (void)closeSecondView
{
    [UIView animateWithDuration:0.4 animations:^{
        
        _secondView.transform = CGAffineTransformIdentity;
        
        
    }];
}

#pragma mark -
#pragma mark UISearchBar Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchBarViewController *searchBarCtr = [[SearchBarViewController alloc] init];
    
    [self.navigationController pushViewController:searchBarCtr animated:YES];
    
    
    return NO;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return NO;
}





@end


















