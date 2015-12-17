//
//  HotSeriesCell.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "HotSeriesCell.h"
#import "UIImageView+WebCache.h"

@implementation HotSeriesCell

-(void)setHotSeriesModel:(HotSeriesModel *)hotSeriesModel
{
    if (_hotSeriesModel != hotSeriesModel) {
        
        _hotSeriesModel = hotSeriesModel;
        
        
        //| ----------------------------------------------------------------------------------
        //Do any additional setup after assign
        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:_hotSeriesModel.serieslogo]];
        
        _carLogoImageView.contentMode = UIViewContentModeScaleAspectFit;
        _carNameLable.text = _hotSeriesModel.seriesname;
    }
}

@end
