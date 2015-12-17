//
//  FavDealerCell.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "FavDealerCell.h"
#import "UIImageView+WebCache.h"

@implementation FavDealerCell

- (void)awakeFromNib {
    // Initialization code
    
    _dealerSaleAreaLable.layer.cornerRadius = 8.0f;
    _dealerSaleAreaLable.layer.masksToBounds = YES;
    
    
}



-(void)setModel:(FavDealerModel *)model
{
    if (_model != model) {
        
        _model = model;
        
        //|-----------------------------------------------------------------------------------
        //!Fill data for cell's subviews
        
        [_carImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
        
        _dealerNameLable.text = model.dname;
        
        _dealerAddressLable.text = model.address;
        
        _dealerSaleAreaLable.text = model.businessarea;

        
        
    }
}

@end
