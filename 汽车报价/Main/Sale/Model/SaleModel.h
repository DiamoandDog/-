//
//  SaleModel.h
//  汽车报价
//
//  Created by imac on 15/9/25.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "BaseModel.h"

@interface SaleModel : BaseModel


@property (nonatomic,strong) NSString *specName;  // 车规范名称
@property (nonatomic,strong) NSString *seriesName;  // 车系列名称
@property (nonatomic,strong) NSString *fctPrice; // 原价
@property (nonatomic,strong) NSString *tip;      // 差价
@property (nonatomic,strong) NSString *dealerPrice; // 处理后的价格
@property (nonatomic,strong) NSString *dealerShortName; // 车行的短名


-(instancetype)initWithDataDic:(NSDictionary *)dataDic; // 初始化方法


@end
