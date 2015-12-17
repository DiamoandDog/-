//
//  CarDetailCell.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecListModel.h"
#import "CustomButton.h"

@interface CarDetailCell : UITableViewCell

@property (nonatomic, strong) SpecListModel *model;


@property (weak, nonatomic  ) IBOutlet UILabel       *CarSummaryLable;

@property (weak, nonatomic  ) IBOutlet UILabel       *officailPriceLable;
@property (weak, nonatomic  ) IBOutlet UILabel       *dealerPriceLable;
@property (weak, nonatomic  ) IBOutlet UILabel       *carOwnersPublicPriceLable;

@property (weak, nonatomic  ) IBOutlet UIControl     *pushControl;

@property (weak, nonatomic  ) IBOutlet UIView        *bgView;


@property (nonatomic, strong) CustomButton  *calculateCarPriceBtn;
@property (nonatomic, strong) CustomButton  *addPkBtn;
@property (nonatomic, strong) CustomButton  *queryLowPriceBtn;

@end






















