//
//  BrandListCell.m
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BrandListCell.h"
#import "UIImageView+WebCache.h"

@implementation BrandListCell


-(void)setModel:(BrandListModel *)model
{
    if (_model != model) {
        _model = model;
        // Match model with cell's userInterface
        
        [_BrandLogoImageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
        
        _BrandNameLable.text = model.name;

    }
}




@end
