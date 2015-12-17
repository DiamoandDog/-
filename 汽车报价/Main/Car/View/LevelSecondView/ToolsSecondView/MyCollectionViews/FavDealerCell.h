//
//  FavDealerCell.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavDealerModel.h"

@interface FavDealerCell : UITableViewCell

@property (nonatomic, strong) FavDealerModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *dealerNameLable;
@property (weak, nonatomic) IBOutlet UILabel *dealerAddressLable;
@property (weak, nonatomic) IBOutlet UILabel *dealerSaleAreaLable;

@end
