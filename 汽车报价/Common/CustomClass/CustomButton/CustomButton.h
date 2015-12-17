//
//  CustomButton.h
//  汽车报价
//
//  Created by Fred on 15/9/23.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

// The subviews of button layout style menu.
typedef enum {
    
    TopLableBottomImageVerticalLayout = 0,
    TopImageBottomLableVerticalLayout,
    LeftLableRightImageHorizontalLayout,
    LeftImageRightLableHorizontalLayout,
    OnlyLableHorizontalLayout,
    OnlyLableVerticalLayout,
    OnlyImageHorizontalLayout,
    OnlyImageVerticalLayout,
    TwoLableVerticalLayout,
    TwoLableHorizontalLayout,
    TwoImageVerticalLayout,
    TwoImageHorizontalLayout

    
}ButtonSubviewsLayoutStyle;


@interface CustomButton : UIControl

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailTitleLable;

@property (nonatomic, copy) NSString *normalImageName;
@property (nonatomic, copy) NSString *highLightImageName;

@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *highLightTitleColor;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) ButtonSubviewsLayoutStyle layoutStyle;





@end
