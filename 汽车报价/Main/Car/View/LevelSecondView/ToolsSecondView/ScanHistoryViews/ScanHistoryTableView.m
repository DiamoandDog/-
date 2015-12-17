//
//  ScanHistoryTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ScanHistoryTableView.h"
#import "ScanHistoryCell.h"


static NSString *scanHistoryCellIdentify = @"ScanHistoryCell";

@implementation ScanHistoryTableView


#pragma mark -
#pragma mark Initialization tableView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Do additional setup after alloc
        
        UINib *scanHistoryCell = [UINib nibWithNibName:@"ScanHistoryCell" bundle:[NSBundle mainBundle]];
        
        [self registerNib:scanHistoryCell forCellReuseIdentifier:scanHistoryCellIdentify];
        
        self.dataSource = self;
        self.delegate = self;
        
        [self _customTableView];
        
    }
    
    return self;
}


- (void)_customTableView
{
    
}


#pragma mark -
#pragma mark UITabkeView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScanHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:scanHistoryCellIdentify forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -
#pragma mark UIScrollView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end








