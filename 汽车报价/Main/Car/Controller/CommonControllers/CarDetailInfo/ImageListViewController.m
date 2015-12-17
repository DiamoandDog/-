//
//  ImageListViewController.m
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ImageListViewController.h"
#import "CustomNetworkRequest.h"
#import "CustomButton.h"
#import "PicListModel.h"
#import "PicTypeListModle.h"

@interface ImageListViewController ()
{
    NSInteger _typeid;
    NSInteger _pageSize;
    CustomButton *_lastBtn;
    UIView *tabBarBgView;
    PicListModel *_picListmodel;
    
}

@end





@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingMoreData) name:KUICollectionLoadingMorePicNOtificationName object:nil];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self _customNavigationBarButtonItems];
    
    
    _typeid = 0;
    _pageSize = 60;
    [self _loadNetworkData];
    
    [self _createSubViewWithIsBtnData:NO ];
    

    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadingMoreData
{
    _pageSize += 60;
    

    
    if (_typeid == 0)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[0];
        if (_pageSize <= [typeModel.piccount  integerValue])
 
        {
           [self _loadNetworkData];

        }
    }else if (_typeid == 10)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[1];

        if (_pageSize <= [typeModel.piccount  integerValue])
            
        {
            [self _loadNetworkData];
            
        }

    }else if (_typeid == 3)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[2];
        
        if (_pageSize <= [typeModel.piccount  integerValue])
            
        {
            [self _loadNetworkData];
            
        }

    }else if (_typeid == 12)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[3];
        
        if (_pageSize <= [typeModel.piccount  integerValue])
            
        {
            [self _loadNetworkData];
            
        }

    }else if (_typeid == 13)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[4];
        
        if (_pageSize <= [typeModel.piccount  integerValue])
            
        {
            [self _loadNetworkData];
            
        }
        
    }else if (_typeid == 14)
    {
        PicTypeListModle *typeModel = _picListmodel.typeListModelArray[5];
        
        if (_pageSize <= [typeModel.piccount  integerValue])
            
        {
            [self _loadNetworkData];
            
        }
    }
    
}



#pragma mark -
#pragma mark CustomNavigationBarButtonItems
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customNavigationBarButtonItems
{
    self.title = @"图片";
    
    //|-----------------------------------------------------------------------------------
    //!Custom rightBarButtonItems
    UIButton *rightFirstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightFirstBtn.frame = CGRectMake(0, 0, 35, 30);
    
    //rightFirstBtn.titleLabel.text = @"车型";
    [rightFirstBtn setTitle:@"颜色" forState:UIControlStateNormal];
    rightFirstBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    rightFirstBtn.titleLabel.textColor = [UIColor whiteColor];
    rightFirstBtn.tag = 100;

    [rightFirstBtn addTarget:self action:@selector(naviBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightFirstBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightFirstBtn];
    
    //| ----------------------------------------------------------------------------------
    UIButton *rightSecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightSecondBtn.frame = CGRectMake(0, 0, 35, 30);
    
    [rightSecondBtn setTitle:@"车型" forState:UIControlStateNormal];
    rightSecondBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    rightSecondBtn.titleLabel.textColor = [UIColor whiteColor];
    rightSecondBtn.tag = 200;
    
    [rightSecondBtn addTarget:self action:@selector(naviBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightSecondBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightSecondBtn];
    

    self.navigationItem.rightBarButtonItems = @[rightFirstBtnItem,rightSecondBtnItem];
}


- (void)naviBarButtonItemAction:(UIButton *)btn
{
    NSLog(@"暂时没实现");
}

#pragma mark -
#pragma mark Create subViews
- (void)_createSubViewWithIsBtnData:(BOOL)isBtnData ;
{

    if (!isBtnData) {
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        subViewCollectionView = [[ImageListCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -KTableBarHeight - KStatuesHeight) collectionViewLayout:flowLayout];
        
        
        
        subViewCollectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
        [self.view addSubview:subViewCollectionView];
        
        
        
    }else if (tabBarBgView == nil)
    {
        
        tabBarBgView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight - KNavigationBarHeight - KTableBarHeight , KScreenWidth, KTableBarHeight)];
        
        tabBarBgView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        
        [self.view addSubview:tabBarBgView];
        
        
        CGFloat btnWidth = (KScreenWidth - 8.0) / 6.0  ;
        CGFloat btnHeitgt = KTableBarHeight;

        _picListmodel =   _imageListModelArray[0];
        
        for (NSInteger i = 0; i < _picListmodel.typeListModelArray.count; i++) {
            
            CustomButton *btn = [[CustomButton alloc] initWithFrame:CGRectMake((btnWidth + 1.0) * i + 1.0, 0, btnWidth, btnHeitgt)];
            
            btn.layoutStyle = TwoLableVerticalLayout;
            
            
            
            PicTypeListModle *typeModel = _picListmodel.typeListModelArray[i];
            
            if (i == 0) {
                btn.isSelected = YES;
            }
            
            btn.titleLabel.text = typeModel.name ;
            btn.detailTitleLable.text = [NSString stringWithFormat:@"(%li)",[typeModel.piccount  integerValue]];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.normalTitleColor = [UIColor darkGrayColor];
            btn.highLightTitleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"anniu@2x"]];
            btn.backgroundColor = [UIColor whiteColor];
            btn.layer.cornerRadius = KScreenWidth / _picListmodel.typeListModelArray.count / 10.0;
            btn.layer.masksToBounds = YES;
            
            btn.tag = 100 + i;
            
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [tabBarBgView addSubview:btn];
            
        }
    }
    

    
    
}

- (void)btnAction:(CustomButton *)btn
{
    
    if (btn != _lastBtn)
    {
        
        if (btn.tag != 100 )
        {
            
            CustomButton * firstBtn = (CustomButton *)[tabBarBgView viewWithTag:100];
            firstBtn.isSelected = NO;
            btn.isSelected = !btn.isSelected;
            
            
        }else
        {
            btn.isSelected = YES;
        }
        
        _lastBtn.isSelected = NO;
        _lastBtn = btn;
    }
    

    
    //| ----------------------------------------------------------------------------------
    switch (btn.tag - 100) {
        case 0:
        {
            _typeid = 0;
        }
            break;

        case 1:
        {
            _typeid = 10;
        }
            break;
        case 2:
        {
            _typeid = 3;

        }
            break;
        case 3:
        {
            _typeid = 12;

        }
            break;
        case 4:
        {
            _typeid = 13;

        }
            break;

        default:
        {
            _typeid = 14;

        }
            break;
        
    }
    
    
    [self _loadNetworkData];
    
}



#pragma mark -
#pragma mark Loading data from network request
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_loadNetworkData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (_seriesID != nil) {
        

        [params setObject:_seriesID forKey:@"seriesid"];
    }
    
    [params setObject:[NSString stringWithFormat:@"%li",_typeid] forKey:@"typeid"];
    
    [params setObject:[NSString stringWithFormat:@"%li",_pageSize] forKey:@"pagesize"];
    [params setObject:@"1" forKey:@"pageindex"];
    
    [CustomNetworkRequest requestWithURL:KPicListURL  params:params requestHeader:nil httpMethod:@"GET" block:^(id result) {
        
        
        NSDictionary *resultDic = result[@"result"];
        _imageListModelArray = [NSMutableArray array];
        
        
        PicListModel *model = [[PicListModel alloc] initWithDictionay:resultDic];
            
        [_imageListModelArray addObject:model];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            subViewCollectionView.imageURLModelCollectionArray  =  self.imageListModelArray;
            
            [self _createSubViewWithIsBtnData:YES ];

        });

        
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


@end
