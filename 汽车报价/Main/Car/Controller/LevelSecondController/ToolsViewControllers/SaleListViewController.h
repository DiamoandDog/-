//
//  SaleListViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "SaleListTableView.h"


@interface SaleListViewController : BaseViewController

@property (nonatomic, strong) SaleListTableView *currentTableView;

//Data from network
@property (nonatomic, strong) NSMutableArray * currentModelArray;

@end
