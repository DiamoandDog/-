//
//  DealerCell.h
//  汽车报价
//
//  Created by imac on 15/10/9.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealerModel.h"
@interface DealerCell : UITableViewCell

@property (nonatomic,strong) DealerModel *dealerModel;
@property (weak, nonatomic) IBOutlet UILabel *dealerName;
@property (weak, nonatomic) IBOutlet UILabel *brandName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *businessArea;
- (IBAction)dealerPhoneAction:(UIButton *)sender;

@end
