//
//  CarHeaderCollectionView.m
//  汽车报价
//
//  Created by Fred on 15/9/28.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarHeaderCollectionView.h"
#import "CarViewController.h"
#import "UIView+GetViewController.h"
#import "NearbyDealerViewController.h"

//register cells
#import "FocusCell.h"
#import "ToolsCell.h"
#import "HotBrandsCell.h"
#import "HotSeriesCell.h"

//subviews
#import "SectionHeaderView.h"
#import "SecondView.h"

//model
#import "HotBrandsModel.h"
#import "HotSeriesModel.h"


//| ----------------------------------------------------------------------------------
//!Tools cell push
#import "MyCollectionViewController.h"
#import "NewCarsMarketViewController.h"
#import "SaleListViewController.h"
#import "ScanHistoryViewController.h"
#import "NearbyDealerViewController.h"

#import "CarDetailInfoViewController.h"


//|-----------------------------------------------------------------------------------
//!Cells identify
static NSString *focusCellIdentify = @"FocusCell";
static NSString *toolsCellIdentify = @"toolsCell";
static NSString *hotBrandsCellIdentify = @"hotBrandsCell";
static NSString *hotSeriesCellIdentify = @"hotSeriesCell";

static NSString *sectionHeaderIdentify = @"sectionHeaderView";


@implementation CarHeaderCollectionView
{
    FocusCell *_focusCell;
    HotBrandsCell *_hotBrandCell;
    HotSeriesCell *_hotSeriesCell;
    
    UINavigationController *_crrentNaviContrl;
    
    NSIndexPath *_hotBrandsIndexPath;
}
#pragma mark -
#pragma mark - Override initialization methods
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{

    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
         
        // Register UICollectionViewCell
        //|-----------------------------------------------------------------------------------
        //!Section Header View
        UINib *sectionHeadrNib = [UINib nibWithNibName:@"SectionHeaderView" bundle:[NSBundle mainBundle]];
        
        [self registerNib:sectionHeadrNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderIdentify];
        

        
        //| ----------------------------------------------------------------------------------
        // Focus
        UINib *focusCellNib = [UINib nibWithNibName:@"FocusCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:focusCellNib forCellWithReuseIdentifier:focusCellIdentify];
        
        //| ----------------------------------------------------------------------------------
        // Tools
        UINib *toolsCellNib = [UINib nibWithNibName:@"ToolsCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:toolsCellNib forCellWithReuseIdentifier:toolsCellIdentify];
        
        //|-----------------------------------------------------------------------------------
        //!HotBrands
        UINib *hotBrandsCellNib = [UINib nibWithNibName:@"HotBrandsCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:hotBrandsCellNib forCellWithReuseIdentifier:hotBrandsCellIdentify];
        
        //|-----------------------------------------------------------------------------------
        //!HotSeries
        UINib *hotSeriesCellNib = [UINib nibWithNibName:@"HotSeriesCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:hotSeriesCellNib forCellWithReuseIdentifier:hotSeriesCellIdentify];


    }
    return self;
}






#pragma mark-
#pragma mark UICollectionView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
// seection number
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}


//// row number in section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (section == 0) {
        
        return 1;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 10;
    }
    return 3;
    
}

// Create cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        
       _focusCell  = [collectionView dequeueReusableCellWithReuseIdentifier:focusCellIdentify forIndexPath:indexPath];
    
        
        _focusCell.backgroundColor = [UIColor whiteColor];
        
        return _focusCell;
    }
    
    if (indexPath.section == 1) {
        
        ToolsCell *toolCell = [collectionView dequeueReusableCellWithReuseIdentifier:toolsCellIdentify  forIndexPath:indexPath];
        
        
        //| ----------------------------------------------------------------------------------
        //!Adding the data for cellView and subviews
        NSArray *toolCellImageNameArray = @[
                                            
                                    @"brand_collect@2x",
                                    @"brand_newCar@2x",
                                    @"brand_hot@2x",
                                    @"brand_history@2x",
                                    @"brand_nearby@2x"
            
                                    ];
        
        NSArray *toolCellTitleTextArray = @[
                                            
                                    @"我的收藏",
                                    @"新车上市",
                                    @"销量排行",
                                    @"浏览历史",
                                    @"附近经销商"
                                    
                                    ];
        
       toolCell.toolsImageView.image  =  [UIImage imageNamed:toolCellImageNameArray[indexPath.row]];
       toolCell.toolstitleLable.text  = toolCellTitleTextArray[indexPath.row];

        toolCell.backgroundColor = [UIColor whiteColor];
        
        return toolCell;
        
        
    }
    
    if (indexPath.section == 2)
    {
        
        _hotBrandCell = [collectionView dequeueReusableCellWithReuseIdentifier:hotBrandsCellIdentify forIndexPath:indexPath];
        
        
        _hotBrandCell.hotBrandsModel =  _hotBrandsCollectionModelArray[indexPath.row];
        _hotBrandCell.backgroundColor = [UIColor whiteColor];//test😊😊😊😊😊test😊😊😊😊😊test
        
        return _hotBrandCell;
    }
    
    
    _hotSeriesCell = [collectionView dequeueReusableCellWithReuseIdentifier:hotSeriesCellIdentify forIndexPath:indexPath];
    
    _hotSeriesCell.backgroundColor = [UIColor whiteColor];//test😊😊😊😊😊test😊😊😊😊😊test
    
    _hotSeriesCell.hotSeriesModel = _hotSeriesCollectionModelArray[indexPath.row];
    
    return _hotSeriesCell;
    
    
    
}




#pragma mark -
#pragma mark UICollection Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return CGSizeMake(self.width, 110);
    }
    if (indexPath.section == 1) {
        return CGSizeMake(self.width / 5 , 90);
    }
    if (indexPath.section == 2) {
        return CGSizeMake(self.width / 5, 75);
    }
    return  CGSizeMake(self.width / 3, 110);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        
        return CGSizeMake(self.width, 0);
        
    }else if (section == 2)
    {
        return CGSizeMake(self.width, 30);
    }else
    {
        return CGSizeMake(self.width, 30);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeMake(self.width, 10);
    }else
    {
    return CGSizeMake(self.width, 0);
    }

}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//选中单元格调用方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _crrentNaviContrl = [self getNavigationController];

    
    switch (indexPath.section) {
        case 0:{
            
        }
            
            break;
        case 1:{
            
            switch (indexPath.row) {
                case 0:{
                    
                    MyCollectionViewController *myCollection = [[MyCollectionViewController alloc] init];

                    [_crrentNaviContrl pushViewController:myCollection animated:YES];
                
                }
                    
                    break;
                case 1:{
                    
                    NewCarsMarketViewController *newCarMarket = [[NewCarsMarketViewController alloc] init];
                    
                    [_crrentNaviContrl pushViewController:newCarMarket animated:YES];
                    

                }
                    
                    break;

                case 2:{
                    
                    SaleListViewController *saleList = [[SaleListViewController alloc] init];
                
                    [_crrentNaviContrl pushViewController:saleList animated:YES];
                    
                }
                    
                    break;

                case 3:{
                    
                    ScanHistoryViewController *scanHistory = [[ScanHistoryViewController alloc] init];
                    
                    [_crrentNaviContrl pushViewController:scanHistory animated:YES];

                }
                    
                    break;
                case 4:{
                    
                    NearbyDealerViewController *nearByMap = [[NearbyDealerViewController alloc] init];
                    
                    [_crrentNaviContrl pushViewController:nearByMap animated:YES];
                    
                    
                    
                }
                    break;

                default:
                    break;
            }
            
        }
            
            break;
        case 2:{
            
            
           CarViewController *viewCtrl = (CarViewController *)[self getViewController];
            
           SecondView *secondView = viewCtrl.secondView;
           HotBrandsModel *model =  _hotBrandsCollectionModelArray[indexPath.row];

            secondView.brandid = model.brandid;
            
            //|-----------------------------------------------------------------------------------
            //!Show secondView and pass data.
            
            [UIView animateWithDuration:0.4 animations:^{
                
                secondView.transform = CGAffineTransformMakeTranslation(-(KScreenWidth - 70), 0);
            }];

            
        }
            
            break;
        case 3:{
            
            CarDetailInfoViewController *detailViewCtrl = [[CarDetailInfoViewController alloc] init];
            
            HotSeriesModel *model = _hotSeriesCollectionModelArray[indexPath.row];
            
            detailViewCtrl.carSeriesId = [NSString stringWithFormat:@"%@", model.seriesid];
            detailViewCtrl.carSalestate = [NSString stringWithFormat:@"%@",model.salestate];
            
            [_crrentNaviContrl pushViewController:detailViewCtrl animated:YES];

        }
            break;
        default:
            
            break;
    }
    
    
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;

    if (indexPath.section == 2 || indexPath.section == 3)
    {
        
        
            SectionHeaderView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionHeaderIdentify forIndexPath:indexPath];
            
            if (indexPath.section == 2)
            {
                header.sectionHeaderLable.text = @"热门品牌";
                
            }else
            {
                header.sectionHeaderLable.text = @"主打车";
            }
            
            reusableView = header;
    }
    
    return reusableView;
    
}





#pragma mark -
#pragma mark Override the setter metods of dataProperties for reloadData
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)setHotBrandsCollectionModelArray:(NSArray *)hotBrandsCollectionModelArray
{
    if (_hotBrandsCollectionModelArray != hotBrandsCollectionModelArray) {
        
        _hotBrandsCollectionModelArray = hotBrandsCollectionModelArray;
    
       [self reloadData];
        

    }
    
}

-(void)setHotSeriesCollectionModelArray:(NSArray *)hotSeriesCollectionModelArray
{
    if (_hotSeriesCollectionModelArray != hotSeriesCollectionModelArray) {
        
        _hotSeriesCollectionModelArray = hotSeriesCollectionModelArray;
        
        [self reloadData];
            
        
    }
    
}

- (void)setFocusListCollectionModelArray:(NSArray *)focusListCollectionModelArray
{
    if (_focusListCollectionModelArray != focusListCollectionModelArray) {
        
        _focusListCollectionModelArray = focusListCollectionModelArray;
        
        //| ----------------------------------------------------------------------------------
        //!Pass focusListCollectionModelArray to HeaderCollectionCell;
        _focusCell.focusListCollectionCellModelArray = _focusListCollectionModelArray;
        
    }
}


@end
