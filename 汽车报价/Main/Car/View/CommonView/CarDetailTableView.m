//
//  CarDetailTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarDetailTableView.h"
#import "CarDetailCell.h"
#import "CarDetailCollectionView.h"
#import "UIView+GetViewController.h"

#import "UIImageView+WebCache.h"
//models
#import "CarDetailModel.h"
#import "YearListModel.h"
#import "EnginListModel.h"
#import "SpecListModel.h"

#import "CarDetailInfoViewController.h"
//Network request
#import "CustomNetworkRequest.h"
//push
#import "ImageListViewController.h"
#import "UIView+GetViewController.h"



#define KTipLableColor [UIColor colorWithRed:0.99 green:0.25 blue:0 alpha:1.0]

static NSString *carDetailCellIdentify = @"CarDeailCell";

@implementation CarDetailTableView
{
    UIButton *_lastBtn;
    UITableViewCell *_saleListsCell;
    
    UIImageView *_headerImageView;
    UIView *_bgView;
    
    CarDetailModel *_model;
}


#pragma mark -
#pragma mark Initialization tableView and custom tableView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //|-----------------------------------------------------------------------------------
        //!
        self.delegate   = self;
        self.dataSource = self;

        UINib *nib      = [UINib nibWithNibName:@"CarDetailCell" bundle:[NSBundle mainBundle]];

        [self registerNib:nib forCellReuseIdentifier:carDetailCellIdentify];

        [self _customTableView];

        
    }
    
    return self;
}


- (void)_customTableView
{
    _model = _detailInfoTableModelArray[0];

    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //|-----------------------------------------------------------------------------------
    //!Create headerView

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,250)];
    
    self.tableHeaderView = headerView;

    
    //| ----------------------------------------------------------------------------------
    _headerImageView   = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 250)];
    
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:_model.logo]];
    
    
    //|-----------------------------------------------------------------------------------
    //!Add UITapGestureRecognizer on _headerImageView for push ImgaeListViewController
    _headerImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [_headerImageView addGestureRecognizer:tap];
    

    [[self getViewController].view insertSubview:_headerImageView aboveSubview:self];

    
    //| ----------------------------------------------------------------------------------
    //Subviews
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0,  250 - 25, KScreenWidth, 25)];
    
    _bgView.backgroundColor = [UIColor colorWithRed:0.32 green:0.30 blue:0.5 alpha:0.6];
    
    [[self getViewController].view addSubview:_bgView];
    
    //| ----------------------------------------------------------------------------------
    UILabel *picCountLable = [[UILabel alloc] initWithFrame:CGRectMake( _bgView.width - 100, 0, 90, 25)];

    picCountLable.text     = [NSString stringWithFormat:@"%li张图",[_model.piccount integerValue]
];

    picCountLable.textColor       = [UIColor whiteColor];
    picCountLable.font            = [UIFont systemFontOfSize:12];
    picCountLable.textAlignment   = NSTextAlignmentRight;
    
    [_bgView addSubview:picCountLable];
    
    
    //| ----------------------------------------------------------------------------------
    UILabel *carInfoLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 25)];

    carInfoLable.text     = [NSString stringWithFormat:@"%@/%@",_model.fctname,_model.levelname];

    carInfoLable.textColor       = [UIColor whiteColor];
    carInfoLable.font            = [UIFont systemFontOfSize:12];

    [_bgView addSubview:carInfoLable];
    
    

    
}


- (void)tapAction
{
    ImageListViewController *imageListCtrl = [[ImageListViewController alloc] init];
    
    imageListCtrl.seriesID = _seriesID;
    
    [[self getNavigationController] pushViewController:imageListCtrl animated:YES];
}


#pragma mark -
#pragma mark Override setter methods for pass seriesID
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setSeriesID:(NSString *)seriesID
{
    if (_seriesID != seriesID) {
        
        _seriesID = seriesID;
    }
}


#pragma mark - Delegate
#pragma mark -
#pragma mark UITableVIew DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3 +_model.enginelistModleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        default:
        {
           EnginListModel *enginModel = _model.enginelistModleArray[section - 3];
            
           return  enginModel.sepcListModelArray.count;
        }
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    switch (indexPath.section) {
        case 0:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //subViews
            //| ----------------------------------------------------------------------------------
            UILabel *carNameLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
            
            carNameLable.text = _model.name;
            carNameLable.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
            carNameLable.font = [UIFont systemFontOfSize:16];
            
            
            [cell.contentView addSubview:carNameLable];
            
            //| ----------------------------------------------------------------------------------
            UILabel *carPriceLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 150, 20)];
            
            carPriceLable.text = [NSString stringWithFormat:@"%@万",_model.fctprice];
            carPriceLable.textColor = KTipLableColor;
            carPriceLable.font = [UIFont systemFontOfSize:14];
            
            
            [cell.contentView addSubview:carPriceLable];
            
            //| ----------------------------------------------------------------------------------
            UIButton *favoritBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            favoritBtn.frame = CGRectMake(KScreenWidth - 60, 15, 55, 55);
            
            [favoritBtn setImage:[UIImage imageNamed:@"shoucang@2x"] forState:UIControlStateNormal];
            [favoritBtn setImage:[UIImage imageNamed:@"shoucang_b@2x"] forState:UIControlStateSelected];
            [favoritBtn addTarget:self action:@selector(favoritBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.contentView addSubview:favoritBtn];
            
            
            return cell;
            
        }
            break;
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            // subViews
            //| ----------------------------------------------------------------------------------
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
            
            flowLayout.minimumInteritemSpacing = 0.5;
            flowLayout.minimumLineSpacing = 0.5;
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

            
            
            CarDetailCollectionView *cardetail = [[ CarDetailCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 100) collectionViewLayout:flowLayout];
            
            cardetail.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
;
            
            
            [cell.contentView addSubview:cardetail];
            
            return cell;

        }
            break;
        case 2:
        {
            _saleListsCell = [[UITableViewCell alloc] init];
            _saleListsCell.selectionStyle = UITableViewCellSelectionStyleNone;
            _saleListsCell.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
;

            //|-----------------------------------------------------------------------------------
            // subViews
            
            
            CGFloat btnWidth = KScreenWidth  / _model.yearlistModleArray.count  - 1 ;
            
            for (NSInteger i = 0; i < _model.yearlistModleArray.count; i++) {
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(i * (btnWidth + 1), 0, btnWidth, 40);
                
                btn.tag = 100 + i;
                if (i == 0)
                {
                    btn.selected = YES;
                }
                
                [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                [btn setTitleColor:KTipLableColor forState:UIControlStateSelected];
                btn.titleLabel.font = [UIFont systemFontOfSize:15];
                btn.backgroundColor = [UIColor whiteColor];
                
                YearListModel *yearModel = _model.yearlistModleArray[i];
                
                [btn setTitle:yearModel.name forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(saleListBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                
                [_saleListsCell.contentView addSubview:btn];

            }
            return _saleListsCell;

        }
            break;


        default:
        {
            CarDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:carDetailCellIdentify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            EnginListModel *listModel = _model.enginelistModleArray[indexPath.section - 3];
            
            cell.model = listModel.sepcListModelArray[indexPath.row];

            return cell;

        }
            break;
    }
    
}



#pragma mark -
#pragma mark Button clicking event in cell's subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)favoritBtnAction:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
    
    /**********************************************************************************
     😊😊😊😊😊😊😊😊😊😊 收藏功能因为sign值不知道是什么，暂且实现不了  😊😊😊😊😊😊😊😊😊😊
     
     sign	ez6H/FfLlmWcAPmFpYA9ON7apNKg/RFw
     userID	351758051124178
     seriesID	3195
     
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:@"ez6H/FfLlmWcAPmFpYA9ON7apNKg/RFw" forKey:@"sign"];
    
    [params setObject:KUserID forKey:@"userID"];
    if (_carSeriesID != nil) {
        
        [params setObject:_carSeriesID forKey:@"seriesID"];
    }
    
    
    
    [CustomNetworkRequest requestWithURL:KFavorSeriesURl params:params requestHeader:nil httpMethod:@"POST" block:^(id result) {
        
        NSLog(@"%@",result[@"success"]);
        
    }];

     ********************************************************************************/
    

    
}


- (void)saleListBtnAction:(UIButton *)btn
{
    
    if (btn.tag != 100) {
        
        UIButton *btn = (UIButton *)[_saleListsCell viewWithTag:100];
        btn.selected = NO;
    }
    _lastBtn.selected = NO;
    
    btn.selected = YES;
    
    _lastBtn = btn;
    
    
}

#pragma mark -
#pragma mark Override the setter methods for reload data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setDetailInfoTableModelArray:(NSArray *)detailInfoTableModelArray
{
    if (_detailInfoTableModelArray != detailInfoTableModelArray) {
        
        _detailInfoTableModelArray = detailInfoTableModelArray;
        
        [self _customTableView];
        
        [self reloadData];
    }
}




#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            return 10;
            break;
        case 2:
            return 10;
            break;
        default:
            return 35;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section > 2) {
        
        EnginListModel *enginModel = _model.enginelistModleArray[section - 3];
        
        //| ----------------------------------------------------------------------------------
        UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 35)];
        
        sectionHeaderView.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1.0];
        
        
        //| ----------------------------------------------------------------------------------
        UILabel *sectionHeaderLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, sectionHeaderView.width- 10, sectionHeaderView.height )];
        
        sectionHeaderLable.text = enginModel.sectionName;
        sectionHeaderLable.textColor = KTipLableColor;
        sectionHeaderLable.font = [UIFont systemFontOfSize:15];
        
        
        [sectionHeaderView addSubview:sectionHeaderLable];
        
        return sectionHeaderView;
    }else
    {
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 80;
            break;
        case 1:
            return 100;
            break;

        case 2:
            return 40;
            break;
        default:
            return 130;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if (section >= 2)
    {
        return 5;
    }
    else
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section > 2) {
        NSLog(@"😊push到新页面😊");

    }
}


#pragma mark - 
#pragma mark UIScrollView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > 30 ) {
        
        [[self getNavigationController].navigationBar setBackgroundImage:[UIImage imageNamed:@"naviBar"]
                                                      forBarMetrics:UIBarMetricsDefault];
        
    }
    else
    {
        [[self getNavigationController].navigationBar setBackgroundImage:[UIImage new]
                                                              forBarMetrics:UIBarMetricsDefault];
        
    }
    
    
    
    //| ----------------------------------------------------------------------------------
    if (offsetY > 0) {
        
        _headerImageView.top = -offsetY;
        
    }else{
        
        CGFloat newHeight = ABS(offsetY)  + 250;
        
        CGFloat newWidth = KScreenWidth / 250 * newHeight;
        
        _headerImageView.frame = CGRectMake(-(newWidth - KScreenWidth) / 2, 0, newWidth, newHeight);
        
    }

    _bgView.bottom = _headerImageView.bottom;

    
  
}





@end









