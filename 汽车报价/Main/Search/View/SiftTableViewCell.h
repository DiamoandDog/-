//
//  SiftTableViewCell.h
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"

@interface SiftTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *seriesnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fctnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *similarButton;

@property (nonatomic,strong)NSMutableDictionary *params;

@property(nonatomic,strong)SearchModel *model;

@end
