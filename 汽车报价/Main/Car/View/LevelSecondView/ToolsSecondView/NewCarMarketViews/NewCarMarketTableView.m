//
//  NewCarMarketTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NewCarMarketTableView.h"
#import "NewCarMarketCell.h"

//push
#import "UIView+GetViewController.h"
#import "CarDetailInfoViewController.h"
//model
#import "NewCarMarketModel.h"

static NSString *newCarMarketIdenty = @"MarketCell";

@implementation NewCarMarketTableView


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
        
        UINib *newCarMarketCellNib = [UINib nibWithNibName:@"NewCarMarketCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:newCarMarketCellNib forCellReuseIdentifier:newCarMarketIdenty];
        
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _marketTableModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewCarMarketCell *cell = [tableView dequeueReusableCellWithIdentifier:newCarMarketIdenty];
    
    
    cell.model =  _marketTableModelArray[indexPath.row];
    

    
    return cell;
    
}

#pragma mark -
#pragma mark  UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewCarMarketModel *model =_marketTableModelArray[indexPath.row];
    
    CarDetailInfoViewController *carDetailCtrl = [[CarDetailInfoViewController alloc] init];
    
    carDetailCtrl.carSeriesId = model.seriesId;
    carDetailCtrl.carSalestate = model.salestate;
    
    [[self getNavigationController] pushViewController:carDetailCtrl animated:YES];
    
    
}




#pragma mark -
#pragma marK Override the setter methods for RefreshData
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)setMarketTableModelArray:(NSArray *)marketTableModelArray
{
    if (_marketTableModelArray != marketTableModelArray) {
        
        _marketTableModelArray = marketTableModelArray;
        
        [self reloadData];
    }
}








@end






