//
//  ToolsCell.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ToolsCell.h"

@implementation ToolsCell


-(void)setToolsImageView:(UIImageView *)toolsImageView
{
    if (_toolsImageView != toolsImageView) {
        
        _toolsImageView = toolsImageView;
        
        //modify some properties
        
        _toolsImageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
}

- (void)setToolstitleLable:(UILabel *)toolstitleLable
{
    if (_toolstitleLable != toolstitleLable) {
        
        _toolstitleLable = toolstitleLable;
        
        //modify some properties
        
        _toolstitleLable.font = [UIFont boldSystemFontOfSize:12];
        _toolstitleLable.textAlignment = NSTextAlignmentCenter;
    }
}
@end
