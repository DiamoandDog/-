//
//  NearByDealerCell.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NearByDealerCell.h"
#import "UIImageView+WebCache.h"

@implementation NearByDealerCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    _saleAreaLable.layer.cornerRadius = 10.0;
    _saleAreaLable.layer.masksToBounds = YES;
    
    
}


- (void)setModel:(NearByDealerListModel *)model
{
    if (_model != model) {
        
        _model = model;
        
        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:model.brandimgurl]];
        
        _carDealerNameLable.text = model.dealername;
        
        _saleAreaLable.text = model.businessarea;
        
        _distanceForMeLable.text = [model.distance stringByAppendingString:@"km"];
    }
}

@end
