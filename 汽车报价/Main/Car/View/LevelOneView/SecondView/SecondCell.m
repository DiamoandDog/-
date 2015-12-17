//
//  SecondCell.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SecondCell.h"
#import "UIImageView+WebCache.h"

@implementation SecondCell


- (void)setSecondModel:(SecondModel *)secondModel
{
    if (_secondModel != secondModel) {
        
        _secondModel = secondModel;
        
        //|-----------------------------------------------------------------------------------
        //!

        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:_secondModel.imgurl]];
        
        _carNameLable.text = secondModel.name;
        
        _carPriceLable.text = secondModel.price;
        
    }
}

@end

