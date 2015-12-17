//
//  SaleListCell.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaleListModel.h"

@interface SaleListCell : UITableViewCell

@property (nonatomic, strong) SaleListModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UIImageView *carLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *carNameLable;
@property (weak, nonatomic) IBOutlet UILabel *carPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *carSalesLable;
@property (weak, nonatomic) IBOutlet UIImageView *salesRankingImageView;

@end
