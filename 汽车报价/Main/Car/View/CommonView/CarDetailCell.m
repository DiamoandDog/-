//
//  CarDetailCell.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarDetailCell.h"

@implementation CarDetailCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    
    _bgView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    //| ----------------------------------------------------------------------------------
    
    [_pushControl addTarget:self action:@selector(pushControlAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    //| ----------------------------------------------------------------------------------
    //!Buttons
    
    CGFloat btnWidth = (KScreenWidth - 2.0) / 3.0 ;
    CGFloat btnHeight = 30.0;
    
    
    _calculateCarPriceBtn = [[CustomButton alloc] initWithFrame:CGRectMake(0, 1, btnWidth, btnHeight)];
    _addPkBtn = [[CustomButton alloc] initWithFrame:CGRectMake(btnWidth + 1.0, 1, btnWidth, btnHeight)];
    _queryLowPriceBtn = [[CustomButton alloc] initWithFrame:CGRectMake(btnWidth * 2.0 + 2.0 , 1, btnWidth, btnHeight)];
    
    _calculateCarPriceBtn.backgroundColor = [UIColor whiteColor];
    _addPkBtn.backgroundColor = [UIColor whiteColor];
    _queryLowPriceBtn.backgroundColor = [UIColor whiteColor];
    
    _calculateCarPriceBtn.tag = 100;
    _addPkBtn.tag = 101;
    _queryLowPriceBtn.tag = 102;
    
    
    _calculateCarPriceBtn.layoutStyle = LeftImageRightLableHorizontalLayout;
    _addPkBtn.layoutStyle             = LeftImageRightLableHorizontalLayout;
    _queryLowPriceBtn.layoutStyle     = LeftImageRightLableHorizontalLayout;
    
    
    
    _calculateCarPriceBtn.titleLabel.text = @"购车计算";
    _addPkBtn.titleLabel.text             = @"添加对比";
    _queryLowPriceBtn.titleLabel.text     = @"询问低价";
    
    
    _calculateCarPriceBtn.titleLabel.textColor = [UIColor darkGrayColor];
    _addPkBtn.titleLabel.textColor = [UIColor darkGrayColor];
    _queryLowPriceBtn.titleLabel.textColor = [UIColor darkGrayColor];


    
    _calculateCarPriceBtn.imageView.image = [UIImage imageNamed:@"ord_priceDetail@2x"];
    _addPkBtn.normalImageName = @"sub_addDuiBi";
    _addPkBtn.highLightImageName = @"sub_addDuiBi_s";
    _queryLowPriceBtn.imageView.image = [UIImage imageNamed:@"ord_order@2x"];
    
    
    [_calculateCarPriceBtn addTarget:self action:@selector(customBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_addPkBtn addTarget:self action:@selector(customBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_queryLowPriceBtn addTarget:self action:@selector(customBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    [_bgView addSubview:_calculateCarPriceBtn];
    [_bgView addSubview:_addPkBtn];
    [_bgView addSubview:_queryLowPriceBtn];
    
}


- (void)customBtnAction:(CustomButton *)btn
{
    NSLog(@"😄你点击我干嘛呀！😄");
}

- (void)pushControlAction
{
    NSLog(@"😄Push到车主晒车款页面😄");
}



//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setModel:(SpecListModel *)model
{
    if (_model != model) {
        
        _model = model;
        
        //| ----------------------------------------------------------------------------------
        //!Lables
        _CarSummaryLable.text = _model.name;
        
        _officailPriceLable.text = [NSString stringWithFormat:@"指导价:%@万",_model.price];
        
        _carOwnersPublicPriceLable.text = [NSString stringWithFormat:@"全国共%li位车主发布价格",        [model.priceDetail integerValue] ];
        
        [self _customDealerPriceLable:[NSString stringWithFormat:@"本地参考低价:%@万",_model.dealerprice]];
        
        

    }
}


- (void)_customDealerPriceLable:(NSString *)string
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 NSForegroundColorAttributeName:[UIColor colorWithRed:0.99 green:0.25 blue:0 alpha:1.0]
                                 
                                 };
    
    
    
    [attributeString addAttributes:attributes range:[string rangeOfString:[NSString stringWithFormat:@"%@万",_model.dealerprice]]];
    
    _dealerPriceLable.attributedText = attributeString;
    
}






@end












