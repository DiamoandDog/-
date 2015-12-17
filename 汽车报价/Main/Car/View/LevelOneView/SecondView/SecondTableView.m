//
//  SecondTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SecondTableView.h"
#import "SecondCell.h"
//model
#import "SecondModel.h"
#import "SecondSectionModel.h"
//push
#import "CarDetailInfoViewController.h"
#import "UIView+GetViewController.h"


static NSString *secondCellIdenty = @"SecondCell";

@implementation SecondTableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Do additonal setup. Example register cell and custom tableView
        
        UINib *secondCellnib = [UINib nibWithNibName:@"SecondCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:secondCellnib forCellReuseIdentifier:secondCellIdenty];
        [self _customTableView];
    }
    
    return self;
}

- (void)_customTableView
{
    
}


#pragma mark - DataSource and Delegate
#pragma mark -
#pragma mark UITableView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _secondTableModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SecondSectionModel *model =_secondTableModelArray[section];
    
    return model.secondModleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondSectionModel *model =_secondTableModelArray[indexPath.section];

    SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:secondCellIdenty];
    
    cell.secondModel = model.secondModleArray[indexPath.row];
    
    
    return cell;
}

#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    
    sectionView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    SecondSectionModel *model =_secondTableModelArray[section];

    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width - 20, 30)];

    sectionLabel.text = model.name;
    sectionLabel.textAlignment = NSTextAlignmentLeft;
    sectionLabel.textColor = [UIColor darkGrayColor];
    sectionLabel.font = [UIFont systemFontOfSize:16];
    
    [sectionView addSubview:sectionLabel];
    
    return sectionView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SecondSectionModel *sectionModel = _secondTableModelArray[indexPath.section];
    
    SecondModel * model = sectionModel.secondModleArray[indexPath.row];
    
    
    CarDetailInfoViewController *carDetailViewCtrl = [[CarDetailInfoViewController alloc] init];
    
    carDetailViewCtrl.carSeriesId = model.seriesId;
    
    [[self getNavigationController] pushViewController:carDetailViewCtrl animated:YES];
    
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
    
}



#pragma mark -
#pragma mark Override setter methods for reload data
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setSecondTableModelArray:(NSArray *)secondTableModelArray
{
    if (_secondTableModelArray != secondTableModelArray) {
        
        _secondTableModelArray = secondTableModelArray;
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self reloadData];

            
        });


    }
}








@end
