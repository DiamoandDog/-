//
//  NearByDealerCell.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearByDealerListModel.h"

@interface NearByDealerCell : UITableViewCell

@property (nonatomic, strong) NearByDealerListModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *carLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *carDealerNameLable;

@property (weak, nonatomic) IBOutlet UILabel *saleAreaLable;
@property (weak, nonatomic) IBOutlet UILabel *distanceForMeLable;

@end
