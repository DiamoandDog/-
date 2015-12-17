//
//  SaleListCell.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SaleListCell.h"
#import "UIImageView+WebCache.h"



@implementation SaleListCell



-(void)setModel:(SaleListModel *)model
{
    if (_model != model)
    {
        
        _model = model;
        
        [_carLogoImageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
        
        _carNameLable.text = model.name;
        
        _carPriceLable.text = [NSString stringWithFormat:@"%@万",model.price];
        
        _carSalesLable.text = [NSString stringWithFormat:@"近30天全国4S店询价订单:%ld笔",[model.ordercount integerValue]];
        
            switch (_indexPath.row)
            {
                case 0:
                {


                 _salesRankingImageView.image = [self maskTextInImageWithText:@"1" andImgae:[UIImage imageNamed:@"trophy_b"]];
                    
                }
                    break;
                case 1:
                {

                    _salesRankingImageView.image = [self maskTextInImageWithText:@"2" andImgae:[UIImage imageNamed:@"trophy_b"]];

                }
                    break;
                    
                case 2:
                {

               _salesRankingImageView.image = [self maskTextInImageWithText:@"3" andImgae:[UIImage imageNamed:@"trophy_b"]];

                }
                    break;
                    
                default:
                {
                    _salesRankingImageView.image = [UIImage imageNamed:@"trophy@2x"];
                }
                    break;
            }
            
    
        
    }
}


- (void)drawRect:(CGRect)rect
{
    
}


- (UIImage *)maskTextInImageWithText:(NSString *)text andImgae:(UIImage *)image
{
    
    UIGraphicsBeginImageContext(image.size);
    
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    
    CGRect textFrame = CGRectMake((image.size.width -40) / 2 , 0 , 40, 20);
    
    
    UIFont *font = [UIFont systemFontOfSize:8];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *dict = @{
                           NSFontAttributeName:font,
                           NSParagraphStyleAttributeName:style,
                           NSForegroundColorAttributeName:color
                           
                           };
    
    
    [text drawInRect:textFrame withAttributes:dict];
    
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return textImage;

    
}

@end
