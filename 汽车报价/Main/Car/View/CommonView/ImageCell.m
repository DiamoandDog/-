
//
//  ImageCell.m
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ImageCell.h"
#import "ListModle.h"
#import "UIImageView+WebCache.h"

@implementation ImageCell


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self _createSubViews];

    
    
}


- (void)_createSubViews
{
    



}


- (void)setModel:(ListModle *)model
{
    if (_model != model) {
        
        _model = model;
    
        //| ----------------------------------------------------------------------------------
        
        [_cellBgImageView sd_setImageWithURL:[ NSURL URLWithString:_model.smallpic]];
        

    }
}


@end
