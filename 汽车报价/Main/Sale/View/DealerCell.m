//
//  DealerCell.m
//  汽车报价
//
//  Created by imac on 15/10/9.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "DealerCell.h"

@implementation DealerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDealerModel:(DealerModel *)dealerModel
{
    if (_dealerModel != dealerModel) {
        _dealerModel = dealerModel;
        self.dealerName.text = dealerModel.dealerName;
        self.brandName.text = dealerModel.brandName;
        self.address.text = dealerModel.address;
        self.businessArea.text = dealerModel.businessArea;
    }
}

- (IBAction)dealerPhoneAction:(UIButton *)sender {
}
@end
