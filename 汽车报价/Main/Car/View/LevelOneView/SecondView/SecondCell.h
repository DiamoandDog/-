//
//  SecondCell.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"

@interface SecondCell : UITableViewCell

@property (nonatomic, strong) SecondModel *secondModel;

@property (weak, nonatomic) IBOutlet UIImageView *carLogoImageView;

@property (weak, nonatomic) IBOutlet UILabel *carNameLable;

@property (weak, nonatomic) IBOutlet UILabel *carPriceLable;


@end
