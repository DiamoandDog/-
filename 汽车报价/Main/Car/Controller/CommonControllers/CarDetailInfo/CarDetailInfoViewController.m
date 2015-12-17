//
//  CarDetailInfoViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarDetailInfoViewController.h"
#import "CustomNetworkRequest.h"
#import "CarDetailModel.h"
#import "CustomButton.h"

@interface CarDetailInfoViewController ()

@end

@implementation CarDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    
    
    [self _createViews];
    
    
}


#pragma mark -
#pragma mark Custom NavigatonBar
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBar:(BOOL)hidden
{
    if (hidden) {
    
        //| ----------------------------------------------------------------------------------
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        UIImage *naviBgimage = [UIImage imageNamed:@"naviBarbgImage@2x"];
        
        [self.navigationController.navigationBar setBackgroundImage:naviBgimage forBarMetrics:UIBarMetricsDefault];
        
        
        


    }
    else
    {
        //|-----------------------------------------------------------------------------------
        //!The NavigationBarButtonItems - right and left
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        backBtn.frame = CGRectMake(0, 0, 30, 30);
        
        backBtn.layer.cornerRadius = 15.0;
        backBtn.layer.masksToBounds = YES;
        
        [backBtn setImage:[UIImage imageNamed:@"back2@2x"] forState:UIControlStateNormal];
        
        [backBtn addTarget:self action:@selector(_backBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        self.navigationItem.leftBarButtonItem = backItem;



        
        //| ----------------------------------------------------------------------------------
        UIButton *pKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        pKBtn.frame = CGRectMake(0, 0, 30, 30);
        
        [pKBtn setImage:[UIImage  imageNamed:@"pk"] forState:UIControlStateNormal];
        
        [pKBtn addTarget:self action:@selector(_pkBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *pkBtnItem = [[UIBarButtonItem alloc] initWithCustomView:pKBtn];
        
        //| ----------------------------------------------------------------------------------
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        shareBtn.frame = CGRectMake(0, 0, 30, 30);
        
        [shareBtn setImage:[UIImage  imageNamed:@"tools_share@2x"] forState:UIControlStateNormal];
        
        [shareBtn addTarget:self action:@selector(_shareBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *shareBtnItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
        
        
        self.navigationItem.rightBarButtonItems = @[pkBtnItem,shareBtnItem];
        
        
        //| ----------------------------------------------------------------------------------
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                     forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
        
    }

}



- (void)_pkBtnAction
{
    NSLog(@"PK点击了");//test😊😊😊😊😊test😊😊😊😊😊test
    
}

- (void)_shareBtnAction
{
    NSLog(@"share点击了");//test😊😊😊😊😊test😊😊😊😊😊test
}

- (void)_backBtnAction
{
    [self.navigationController popViewControllerAnimated:YES];

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





#pragma mark - 
#pragma mark Loading data from networking 
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_loadNetworkData
{
    
    //|-----------------------------------------------------------------------------------
    //!Network request

    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (_carSeriesId != nil) {
        [params setObject:_carSeriesId forKey:@"seriesid"];
        
        _detailTableView.seriesID = _carSeriesId;

    }
    if (_provinceId != nil) {
        [params setObject:_provinceId forKey:@"provinceid" ];
        
    }
    if (_cityId != nil) {
        [params setObject:_cityId forKey:@"cityid" ];
        
    }
    if (_carSalestate != nil) {
        [params setObject:_carSalestate forKey:@"salestate" ];
        
    }
    
    [CustomNetworkRequest requestWithURL:KCarDetailURL params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
        
        
        
        if (_carSeriesId != nil) {
            
            _detailInfoModelArray = [NSMutableArray array];
            
            CarDetailModel *model = [[CarDetailModel alloc] initWithDictionary:result[@"result"]];
            
            [_detailInfoModelArray addObject:model];
            
        }
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _detailTableView.detailInfoTableModelArray = _detailInfoModelArray;
        });

    }];
    
    
}


#pragma mark -
#pragma mark Override setter methods for request data from network

//| ----------------------------------------------------------------------------------
-(void)setCarSeriesId:(NSString *)carSeriesId
{
    if (_carSeriesId != carSeriesId) {
        
        _carSeriesId = carSeriesId;
        
        
        [self _loadNetworkData];

    }
}
#pragma mark -
#pragma mark Create subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_createViews
{
    //|-----------------------------------------------------------------------------------
    //!Subviews for tableView

    _detailTableView = [[CarDetailTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -KTableBarHeight)];
    
    _detailTableView.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0];
    _detailTableView.seriesID = _carSeriesId;

    
    [self.view addSubview:_detailTableView];
    
    
    
    //|-----------------------------------------------------------------------------------
    //!Subviews for bottom qurey Button
    UIView *tabBarView =[[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight - KTableBarHeight, KScreenWidth, KTableBarHeight)];
    
    tabBarView.backgroundColor = [UIColor colorWithWhite:0.86 alpha:1.0];
    
    [self.view addSubview:tabBarView];
    
    CustomButton *queryBtn = [[CustomButton alloc] initWithFrame:CGRectMake(8, 5, KScreenWidth - 16, KTableBarHeight - 10)];
    
    
    queryBtn.layoutStyle = TopImageBottomLableVerticalLayout;
    queryBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"naviBarbgImage"]];
    
    queryBtn.titleLabel.text = @"全系查询";
    queryBtn.titleLabel.textColor = [UIColor whiteColor];
    queryBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    
    [queryBtn addTarget:self action:@selector(queryBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [tabBarView addSubview:queryBtn];
    
    
    
}

- (void)queryBtnAction
{
    NSLog(@"😊暂时还没实现奥！😊");
}







@end
