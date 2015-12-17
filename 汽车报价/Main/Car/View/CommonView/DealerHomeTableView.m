//
//  DealerHomeTableView.m
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "DealerHomeTableView.h"

static NSString *dealercellIdentify = @"DealerCell";

@implementation DealerHomeTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:dealercellIdentify];
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Initialization and custom tableview
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customTableView
{
    
    
    
    
}

#pragma  mark -
#pragma  mark UITableView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dealercellIdentify forIndexPath:indexPath];
    
    
    
    return cell;
}



#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end














