//
//  HotBrandsCell.h
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotBrandsModel.h"

@interface HotBrandsCell : UICollectionViewCell

@property (nonatomic, strong) HotBrandsModel *hotBrandsModel;

@property (weak, nonatomic) IBOutlet UIImageView *carLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel *carNameLable;

@end
