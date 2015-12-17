//
//  NearByDealerTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NearByDealerTableView.h"
#import "NearByDealerCell.h"

#import "NearByDealerModel.h"


//push
#import "UIView+GetViewController.h"
#import "DealerHomeViewController.h"

static NSString *nearByDealerIdenty = @"NearByDealerCell";

@implementation NearByDealerTableView

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
        
        UINib *nearByDealerCellNib = [UINib nibWithNibName:@"NearByDealerCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:nearByDealerCellNib forCellReuseIdentifier:nearByDealerIdenty];
        
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
    
    
   NearByDealerModel *model = _dealerTableViewArray[0];
    
    return model.ListModelArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NearByDealerCell *cell = [tableView dequeueReusableCellWithIdentifier:nearByDealerIdenty];
    
    NearByDealerModel *model = _dealerTableViewArray[0];

    cell.model = model.ListModelArray[indexPath.row];

    return cell;
    
}

#pragma mark -
#pragma mark  UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DealerHomeViewController *dealerHomeCtrl = [[DealerHomeViewController alloc] init];
    
    [[self getNavigationController] pushViewController:dealerHomeCtrl animated:YES];
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
-(void)setDealerTableViewArray:(NSArray *)dealerTableViewArray
{
    if (_dealerTableViewArray != dealerTableViewArray) {
        
        _dealerTableViewArray = dealerTableViewArray;
        
        [self reloadData];
        
    }
}











@end
