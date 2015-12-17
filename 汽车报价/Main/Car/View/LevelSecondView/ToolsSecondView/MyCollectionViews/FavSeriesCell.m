//
//  FavSeriesCell.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "FavSeriesCell.h"
#import "UIImageView+WebCache.h"

@implementation FavSeriesCell


- (void)setModel:(FavSeriesModel *)model
{
    if (_model != model) {
        
        _model = model;
        
        //|-----------------------------------------------------------------------------------
        //!Fill data for cell's subviews
        [_carImageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
        
        _seriesNameLable.text = model.seriesname;
        
        _carFctPrice.text = model.fctprice;
        
        _carInforLable.text = [NSString stringWithFormat:@"%@%@",model.fctname,model.levelname];
        

    }
}



@end
