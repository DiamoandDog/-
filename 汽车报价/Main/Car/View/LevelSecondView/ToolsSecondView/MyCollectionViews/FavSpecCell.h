//
//  FavSpecCell.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavSpecListModel.h"


@interface FavSpecCell : UITableViewCell

@property (nonatomic, strong) FavSpecListModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *carImageView;

@property (weak, nonatomic) IBOutlet UILabel *carSpecNameLable;
@property (weak, nonatomic) IBOutlet UILabel *carfctPriceLable;

@property (weak, nonatomic) IBOutlet UILabel *dealerPriceLable;

@end
