//
//  CustomButton.m
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton


#pragma mark - 
#pragma mark Create by alloc and init or loading for nib
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //Do some additional setup
        _isSelected = NO;
        
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //Do some additionnal setup
    _isSelected = NO;


    
}


#pragma mark -
#pragma mark Override the setter methods of properties
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)setIsSelected:(BOOL)isSelected
{
    if (_isSelected != isSelected) {
        
        _isSelected = isSelected;
        
        if (_isSelected)
        {
            if (_imageView != nil ) {
                
                self.imageView.image = [UIImage imageNamed:_highLightImageName];
            }
            if (_titleLabel != nil) {
                
                self.titleLabel.textColor = _highLightTitleColor;
            }
            if (_detailTitleLable != nil) {
                
                self.detailTitleLable.textColor = _highLightTitleColor;
            }
            
            
        }
        else
        {
            if (_imageView != nil) {
                
                self.imageView.image = [UIImage imageNamed:_normalImageName];
            }
            if (_titleLabel != nil) {
                
                self.titleLabel.textColor = _normalTitleColor;
            }
            if (_detailTitleLable != nil) {
                
                self.detailTitleLable.textColor = _normalTitleColor;
            }
        }
    }

    
    
}


- (void)setNormalImageName:(NSString *)normalImageName
{
    if (_normalImageName != normalImageName) {
        
        _normalImageName = normalImageName;
        
        if (!_isSelected) {
            
            self.imageView.image = [UIImage imageNamed:_normalImageName];

        }
    }
    [self layoutIfNeeded];

}

-(void)setHighLightImageName:(NSString *)highLightImageName
{
    if (_highLightImageName != highLightImageName) {
        
        _highLightImageName = highLightImageName;
        
        if (_isSelected) {
            
            self.imageView.image = [UIImage imageNamed:_highLightImageName];

        }
        
    }
    [self layoutIfNeeded];

}


- (void)setNormalTitleColor:(UIColor *)normalTitleColor
{
    if (_normalTitleColor != normalTitleColor) {
        
        _normalTitleColor = normalTitleColor;
        
        if (!_isSelected)
        {
            self.titleLabel.textColor = _normalTitleColor;
            self.detailTitleLable.textColor = _normalTitleColor;
        }
    }

    
}


- (void)setHighLightTitleColor:(UIColor *)highLightTitleColor
{
    if (_highLightTitleColor != highLightTitleColor) {
        
        _highLightTitleColor = highLightTitleColor;
        if (_isSelected)
        {
            
            self.titleLabel.textColor = _highLightTitleColor;
            self.detailTitleLable.textColor = _highLightTitleColor;
        }
    }

}


#pragma mark -
#pragma mark Override the getter methods of properties
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        
        // 1.Create _imageView object
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        // 2.Configure _imageView object
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:_imageView];
        
    }
    [self layoutIfNeeded];

    return _imageView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        
        // 1.Create _titleLable object
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        // 2.Configure _titleLabel
        _titleLabel.font = [UIFont systemFontOfSize:11];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        
        [self addSubview:_titleLabel];
        
        
    }
    //[self layoutIfNeeded];
    return _titleLabel;
}

- (UILabel *)detailTitleLable
{
    if (_detailTitleLable == nil) {
        
        _detailTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _detailTitleLable.font = [UIFont systemFontOfSize:10];
        _detailTitleLable.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_detailTitleLable];
    }
    
    return _detailTitleLable;
}

#pragma mark -
#pragma mark Layout subviews
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    if (_layoutStyle == TopImageBottomLableVerticalLayout) {
        
        
        _imageView.frame = CGRectMake(self.frame.size.width / 4  , self.frame.size.height / 16, self.frame.size.width / 2, self.frame.size.height / 2);
        
        _titleLabel.frame = CGRectMake(self.frame.size.width / 4  , self.frame.size.height / 2, self.frame.size.width / 2, self.frame.size.height / 2);
        
        
    }
    else if (_layoutStyle == TopLableBottomImageVerticalLayout)
    {
        
        

    }else if (_layoutStyle == LeftImageRightLableHorizontalLayout)
    {
        _imageView.frame = CGRectMake(0, 0, self.width / 2, self.height);
        _titleLabel.frame = CGRectMake( _imageView.width + 0.0, self.height / 8, self.width - _imageView.width, self.height - self.height / 4);

    }
    else if (_layoutStyle == LeftLableRightImageHorizontalLayout)
    {
        _titleLabel.frame = CGRectMake(0.0, 0.0, self.frame.size.width / 2.0 , self.frame.size.height  );
        
        _imageView.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) ,10 ,self.frame.size.width - 40.0 ,self.frame.size.height - 20  );
    }
    else if (_layoutStyle == OnlyLableVerticalLayout)
    {
        _titleLabel.frame = CGRectMake(self.frame.size.width / 4.0, self.frame.size.height / 16, self.frame.size.width / 2.0, self.frame.size.height  - self.frame.size.height / 8);
    }else if (_layoutStyle == TwoLableVerticalLayout)
    {
        _titleLabel.frame = CGRectMake(self.frame.size.width / 10.0, 0, self.frame.size.width / 5.0 * 4.0 , self.frame.size.height / 2);
        
        _detailTitleLable.frame = CGRectMake(self.frame.size.width / 10.0, CGRectGetMaxY(_titleLabel.frame), self.frame.size.width / 5.0 * 4.0, self.frame.size.height / 2);
    }
    
    
    
    
}




@end
















