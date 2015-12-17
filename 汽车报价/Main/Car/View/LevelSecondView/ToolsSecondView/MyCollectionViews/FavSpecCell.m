//
//  FavSpecCell.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "FavSpecCell.h"
#import "UIImageView+WebCache.h"

@implementation FavSpecCell



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self _customDealerPriceLabel:_dealerPriceLable.text];
    
}

-(void)setModel:(FavSpecListModel *)model
{
    if (_model != model)
    {
        
        _model = model;
        
        //|-----------------------------------------------------------------------------------
        //!Full data for cell
        
        [_carImageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
        
        _carSpecNameLable.text = model.specname;
        
        _carfctPriceLable.text = model.fctprice;
        
        [self _customDealerPriceLabel:model.dealerprice];
        
   }
}

- (void)_customDealerPriceLabel:(NSString *)string
{
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attrString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:[string rangeOfString:string]];
    
    [attrString addAttribute:NSKernAttributeName value:[NSNull null] range:[string rangeOfString:string]];
    
    _dealerPriceLable.attributedText = attrString;

}

@end
