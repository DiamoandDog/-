//
//  NewCarMarketCell.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NewCarMarketCell.h"
#import "UIImageView+WebCache.h"

#import "UIView+GetViewController.h"
#import "WebViewController.h"
#import "BaseNavigationController.h"
@implementation NewCarMarketCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    // Do any additional setup after loading nib file
    [self _customTableViewCell];
}




- (void)_customTableViewCell
{
    //|-----------------------------------------------------------------------------------
    //!Add UIGestureRecognizer for carNewsTitleLable
    UIControl *carNewsButton = [[UIControl alloc] initWithFrame:CGRectMake(0, self.height / 4 * 3,self.width / 2 , self.height / 4 )];
    
    [carNewsButton addTarget:self action:@selector(openWebViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:carNewsButton];
}



- (void)setModel:(NewCarMarketModel *)model
{
    if ( _model != model) {
        
         _model = model;
        

        //|-----------------------------------------------------------------------------------
        //!Do additional setup for cell
        //[self _addTapGestureRecognizer];


        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
        
        _carNameLable.text = model.name;
        
        _carPriceLable.text = model.price;
        

        _carNewsTitleLable.text = model.newstitle;
        

        //|-----------------------------------------------------------------------------------

        if (model.selltime.length > 0) {
            
            self.carSellTimeLable.text = model.selltime;
        }
        else if (_carSellTimeLable != nil)
        {
            [_carSellTimeLable removeFromSuperview];
            
            _carSellTimeLable = nil;
        }
        
    }
}


- (UILabel *)carSellTimeLable
{
    if (_carSellTimeLable == nil) {
        
        _carSellTimeLable = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _carSellTimeLable.textColor = [UIColor grayColor];
        _carSellTimeLable.textAlignment = NSTextAlignmentLeft;
        _carSellTimeLable.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:_carSellTimeLable];
        
    }
    return _carSellTimeLable;
}


- (void)layoutSubviews
{
    _carSellTimeLable.frame = CGRectMake(108, 55,150 , 25);
}


- (void)_addTapGestureRecognizer
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:_carNewsTitleLable action:@selector(openWebViewController)];
    
    tap.delegate = self;
    
    [_carNewsTitleLable addGestureRecognizer:tap];
}


- (void)openWebViewController
{
    WebViewController *carNewsWeb = [[WebViewController alloc] init];
    
    
    carNewsWeb.webUrl = _model.newsurl;
    
    
    
    [ (BaseNavigationController *)[self getNavigationController] pushViewController:carNewsWeb animated:YES];
    
}




@end
