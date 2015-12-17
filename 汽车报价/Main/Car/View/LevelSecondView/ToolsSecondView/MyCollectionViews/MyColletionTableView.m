//
//  MyColletionTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "MyColletionTableView.h"

//push
#import "UIView+GetViewController.h"
#import "CarDetailInfoViewController.h"
#import "DealerHomeViewController.h"
#import "CarStyleViewController.h"



//cells
#import "FavSeriesCell.h"
#import "FavSpecCell.h"
#import "FavDealerCell.h"

//modles
#import "FavSpecModel.h"
#import "FavSeriesModel.h"
#import "FavDealerModel.h"


static NSString *favSeriesCellIdentify = @"FavSeriesCell";
static NSString *favSpecCellIdentify   = @"FavSpecCell";
static NSString *favDealerCellIdentify = @"FavDealerCell";

@implementation MyColletionTableView


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Do additional setup for modify the cell's subview from nib
    
}



#pragma mark -
#pragma mark Override the initialization for custom tableView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Do additional setup for Custom tableView and Register cells
        [super customRefreshTypeWithRefreshDown:YES  RefreshUp:NO RefrehTouchView:NO RefreshTouchPoint:NO];
        
        //|-----------------------------------------------------------------------------------
        //!Register cells for current tableView

        UINib *favSeriesCellNib = [UINib nibWithNibName:@"FavSeriesCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:favSeriesCellNib forCellReuseIdentifier:favSeriesCellIdentify];
        
        UINib *favSpecCellNib = [UINib nibWithNibName:@"FavSpecCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:favSpecCellNib forCellReuseIdentifier:favSpecCellIdentify];
        
        UINib *favDealerCellNib = [UINib nibWithNibName:@"FavDealerCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:favDealerCellNib forCellReuseIdentifier:favDealerCellIdentify];
        

        
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
    return _myColletionTableModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_flag) {
            
        case 0:
        {
            FavSeriesCell *cell = [tableView dequeueReusableCellWithIdentifier:favSeriesCellIdentify];
            
            cell.model = _myColletionTableModelArray[indexPath.row];
            
            return cell;
        }

            break;
        case 1:
        {
            FavSpecCell *cell = [tableView dequeueReusableCellWithIdentifier:favSpecCellIdentify];
            
            FavSpecModel *model = _myColletionTableModelArray[indexPath.section];
            
            cell.model = model.favSpecListModelArray[indexPath.row];
            
            return cell;
        }
            
            
            break;
        case 2:
        {
            FavDealerCell *cell = [tableView dequeueReusableCellWithIdentifier:favDealerCellIdentify];
            
           cell.model = _myColletionTableModelArray[indexPath.row];

            return cell;
        }
        
            break;


            
        default:
        {
            
            return nil;
        }
            break;
    }
    

    
    
    
}

#pragma mark -
#pragma mark  UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_flag) {
        case 0:
        {
            
            FavSeriesModel *model = _myColletionTableModelArray[indexPath.row];
            
            CarDetailInfoViewController *carDetailCtrl = [[CarDetailInfoViewController alloc] init];
            carDetailCtrl.carSeriesId = model.seriesid;
            carDetailCtrl.carSalestate = model.salesstate;
            
            
            [[self getNavigationController] pushViewController:carDetailCtrl animated:YES];

        }
            break;
        case 1:
        {
            FavSpecModel *model = _myColletionTableModelArray[indexPath.row];
            
            CarStyleViewController *carStyleCtrl = [[CarStyleViewController alloc] init];
            
            carStyleCtrl.carSalestate = model.salestate;
            carStyleCtrl.carSeriesId = model.seriesid;
            
            [[self getNavigationController] pushViewController:carStyleCtrl animated:YES];
            
        }
            break;

        case 2:
        {
            DealerHomeViewController *dealerHomeCtrl = [[DealerHomeViewController alloc] init];
            
            [[self getNavigationController] pushViewController:dealerHomeCtrl animated:YES];
        }
            break;

            
        default:
            break;
    }
}






#pragma mark -
#pragma marK Override the setter methods for RefreshData
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

-(void)setMyColletionTableModelArray:(NSArray *)myColletionTableModelArray
{
    if (_myColletionTableModelArray != myColletionTableModelArray) {
        
        _myColletionTableModelArray = myColletionTableModelArray;
        
        [self reloadData];
    }
}




@end
