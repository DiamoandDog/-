//
//  HotSeriesCell.h
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotSeriesModel.h"

@interface HotSeriesCell : UICollectionViewCell

@property (nonatomic, strong) HotSeriesModel *hotSeriesModel;


@property (weak, nonatomic) IBOutlet UIImageView *carLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *carNameLable;

@end
