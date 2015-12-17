//
//  NoCarDataView.m
//  汽车报价
//
//  Created by Fred on 15/10/1.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NoCarDataView.h"

#define imgWitdh 80
@implementation NoCarDataView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:@"no_car_data.png"];
    NSString *text = @"暂无数据";
    CGRect imgFrame = CGRectMake((self.width - imgWitdh)/2 , 50, imgWitdh, imgWitdh);
    CGRect textFrame = CGRectMake(CGRectGetMinX(imgFrame),CGRectGetMaxY(imgFrame),imgWitdh,25);
    
    //   设置字体居中
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:style
                                 };
    //    开始绘图
    [image drawInRect:imgFrame];
    [text drawInRect:textFrame withAttributes:attributes];
    
    
}


@end
