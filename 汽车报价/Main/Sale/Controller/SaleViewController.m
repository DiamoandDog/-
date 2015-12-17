//
//  SaleViewController.m
//  汽车报价
//
//  Created by imac on 15/9/24.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "SaleViewController.h"

@implementation SaleViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    [super customNavigationBarWithTitle:NO];
    [self _createViews];
    [self _createCustomNavigationBarButtonItems];
    self.navigationController.navigationBar.translucent = NO;
}


- (void)viewDidAppear:(BOOL)animated{
    
}









#pragma mark - Create  SubView创建
- (void)_createViews
{
    

    _topSegment = [[UISegmentedControl alloc] initWithItems:@[@"全部品牌",@"全部条件",@"价格最低"]];
    _topSegment.selectedSegmentIndex = 0;
    _topSegment.frame = CGRectMake(0, 0, KScreenWidth, 40);
    _topSegment.backgroundColor = [UIColor whiteColor];
    _topSegment.tintColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    [self.view addSubview:_topSegment];
    
    _nextSegment = [[UISegmentedControl alloc] initWithItems:@[@"全部品牌",@"全部区域",@"智能排序"]];
    _nextSegment.selectedSegmentIndex = 0;
    _nextSegment.frame = CGRectMake(KScreenWidth, 0, KScreenWidth, 40);
    _nextSegment.backgroundColor = [UIColor whiteColor];
    _nextSegment.tintColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    [self.view addSubview:_nextSegment];
    
    
    // UITableView 创建
    
    _saleTableView = [[SaleTableView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, KScreenHeight - 40)];
    _saleTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:_saleTableView];
    _dealerTableView = [[DealerTableView alloc] initWithFrame:CGRectMake(KScreenWidth, 40, KScreenWidth, KScreenHeight - 40)];
    _dealerTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:_dealerTableView];



}

#pragma mark - button创建
- (void)_createCustomNavigationBarButtonItems
{
    _segmented.frame = CGRectMake(0, 0, 100, 30);
    
    [_segmented addTarget:self action:@selector(segmentedAction) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = _segmented;

}


-(void)segmentedAction
{
    NSParameterAssert(_segmented.selectedSegmentIndex == 0 || _segmented.selectedSegmentIndex == 1);
    
    if (_segmented.selectedSegmentIndex == 0) {
        [UIView animateWithDuration:0.4 animations:^{
            _dealerTableView.transform = CGAffineTransformIdentity;
            _nextSegment.transform = CGAffineTransformIdentity;
            _topSegment.transform = CGAffineTransformIdentity;
        }];
        
    }else if (_segmented.selectedSegmentIndex == 1)
    {
        [UIView animateWithDuration:0.4 animations:^{
            _dealerTableView.transform = CGAffineTransformMakeTranslation(-KScreenWidth, 0);
            _nextSegment.transform = CGAffineTransformMakeTranslation(-KScreenWidth, 0);
            _topSegment.transform = CGAffineTransformMakeTranslation(-KScreenWidth, 0);
        }];
        
    }
}



@end
