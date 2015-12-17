//
//  SaleCell.h
//  汽车报价
//
//  Created by imac on 15/9/25.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaleModel.h"

@interface SaleCell : UITableViewCell

@property (nonatomic, strong)SaleModel *cellModel;

@property (weak, nonatomic) IBOutlet UILabel *specName;    // 车规范名称
@property (weak, nonatomic) IBOutlet UILabel *seriesName;  //  车系列名称
@property (weak, nonatomic) IBOutlet UILabel *fctPrice;    //   原价
@property (weak, nonatomic) IBOutlet UILabel *tip;         //   差价
@property (weak, nonatomic) IBOutlet UILabel *dealerPrice;  //  处理后的价格
@property (weak, nonatomic) IBOutlet UILabel *dealerShortName; //  车行短名
- (IBAction)phoneAction:(UIButton *)sender;
- (IBAction)askAction:(UIButton *)sender;

@end
