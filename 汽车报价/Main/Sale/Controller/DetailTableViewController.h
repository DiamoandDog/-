//
//  DetailTableViewController.h
//  汽车报价
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaleModel.h"
@interface DetailTableViewController : UITableViewController


@property (nonatomic,strong) SaleModel *saleModel;
@property (weak, nonatomic) IBOutlet UILabel *carStyle;

@property (weak, nonatomic) IBOutlet UILabel *carPrice;
@property (weak, nonatomic) IBOutlet UILabel *cheapestPrice;
@property (weak, nonatomic) IBOutlet UILabel *tipPrice;
@property (weak, nonatomic) IBOutlet UILabel *saleTime;
@property (weak, nonatomic) IBOutlet UILabel *carModel;
@property (weak, nonatomic) IBOutlet UILabel *saleAdress;

@end
