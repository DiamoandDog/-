//
//  SaleListTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SaleListTableView.h"
#import "SaleListCell.h"
//models
#import "SaleListSectionModel.h"
#import "SaleListModel.h"

//push
#import "UIView+GetViewController.h"
#import "CarDetailInfoViewController.h"

static NSString *saleListCellIdentify = @"saleListCell";

@implementation SaleListTableView


#pragma mark -
#pragma mark Override the initialization for custom tableView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Do additional setup for Custom tableView and Register cells
        [super customRefreshTypeWithRefreshDown:YES  RefreshUp:YES RefrehTouchView:NO RefreshTouchPoint:YES];
        
        UINib *newCarMarketCellNib = [UINib nibWithNibName:@"SaleListCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:newCarMarketCellNib forCellReuseIdentifier:saleListCellIdentify];
        
        [self _customTableView];
        
    }
    return self;
    
}


- (void)_customTableView
{
    
    //Nothing will be done
    
}



#pragma mark -
#pragma mark UITableView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableModelArray.count;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SaleListSectionModel *sectionModel = _tableModelArray[section];
    
    return  sectionModel.sectionModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SaleListCell *cell = [tableView dequeueReusableCellWithIdentifier:saleListCellIdentify];
    
    SaleListSectionModel *sectionModel = _tableModelArray[indexPath.section];

    cell.indexPath = indexPath;

    cell.model = sectionModel.sectionModelArray[indexPath.row];
    

    
    return cell;
    
}

#pragma mark -
#pragma mark  UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    
    
    
    sectionView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    SaleListSectionModel *model =_tableModelArray[section];
    
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width - 20, 30)];
    
    sectionLabel.text = model.name;
    sectionLabel.textAlignment = NSTextAlignmentLeft;
    sectionLabel.textColor = [UIColor darkGrayColor];
    sectionLabel.font = [UIFont systemFontOfSize:16];
    
    [sectionView addSubview:sectionLabel];
    
    return sectionView;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SaleListSectionModel *sectionModel = _tableModelArray[indexPath.section];
    SaleListModel *model = sectionModel.sectionModelArray[indexPath.row];
    
    CarDetailInfoViewController *carDetailCtrl = [[CarDetailInfoViewController alloc] init];
    
    carDetailCtrl.carSeriesId = model.seriesId;
    
    
    [[self getNavigationController] pushViewController:carDetailCtrl animated:YES];
}

#pragma mark -
#pragma mark UIScrollView Delegete
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    
    if (yOffset < 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
        
    }
    // NSLog(@"%f",yOffset);//test😊😊😊😊😊test😊😊😊😊😊test
    
}



#pragma mark -
#pragma mark Override the setter methods to reload data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setTableModelArray:(NSArray *)tableModelArray
{
    if (_tableModelArray != tableModelArray) {
        
        _tableModelArray = tableModelArray;
        
        [self reloadData];

    }
}
@end
