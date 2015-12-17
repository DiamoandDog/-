//
//  HotBrandsCell.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "HotBrandsCell.h"
#import "UIImageView+WebCache.h"


@implementation HotBrandsCell

-(void)setHotBrandsModel:(HotBrandsModel *)hotBrandsModel
{
    if (_hotBrandsModel != hotBrandsModel) {
        
        _hotBrandsModel = hotBrandsModel;
        
        
        //| ----------------------------------------------------------------------------------
        //Do any additional setup after assign.
        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:_hotBrandsModel.imgurl]];
        
        _carNameLable.text = _hotBrandsModel.name;
        
        
    
    }
    
}

@end
