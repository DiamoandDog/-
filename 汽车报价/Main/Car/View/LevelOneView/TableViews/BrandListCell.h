//
//  BrandListCell.h
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandListModel.h"

@interface BrandListCell : UITableViewCell

@property (nonatomic, strong) BrandListModel *model;
@property (weak, nonatomic) IBOutlet UILabel *BrandNameLable;
@property (weak, nonatomic) IBOutlet UIImageView *BrandLogoImageView;

@end
