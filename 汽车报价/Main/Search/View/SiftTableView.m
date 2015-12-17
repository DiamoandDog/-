//
//  SiftTableView.m
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SiftTableView.h"
#import "SiftTableViewCell.h"
#import "SearchModel.h"

#import "UIView+GetViewController.h"
//push
#import "CarDetailInfoViewController.h"

@implementation SiftTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initTableView];
    }
    return self;
}

- (void)_initTableView {
    self.dataSource = self;
    self.delegate = self;
    UINib *nib = [UINib nibWithNibName:@"SiftTableViewCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"myCell"];
}

#pragma mark -
#pragma mark - UItTableView DataSourece
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.params = _params;
    SearchModel *model = _modelArray[indexPath.row];
    cell.model = model;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CarDetailInfoViewController *carDetailCtrl = [[CarDetailInfoViewController alloc] init];
    
    [[self getNavigationController] pushViewController:carDetailCtrl animated:YES];
}


@end
