//
//  FavSeriesCell.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavSeriesModel.h"

@interface FavSeriesCell : UITableViewCell

@property (nonatomic, strong) FavSeriesModel *model;



@property (weak, nonatomic) IBOutlet UIImageView *carImageView;

@property (weak, nonatomic) IBOutlet UILabel *seriesNameLable;

@property (weak, nonatomic) IBOutlet UILabel *carFctPrice;

@property (weak, nonatomic) IBOutlet UILabel *carInforLable;


@end
