//
//  DealerModel.h
//  汽车报价
//
//  Created by imac on 15/10/10.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "BaseModel.h"

@interface DealerModel : BaseModel


@property (nonatomic,strong) NSString *dealerName; // 店名
@property (nonatomic,strong) NSString *brandName; // 品牌名
@property (nonatomic,strong) NSString *address; // 地址
@property (nonatomic,strong) NSString *dealerPhone; // 电话号码
@property (nonatomic,strong) NSString *businessArea; // 销售地区

-(instancetype)initWithDataDic:(NSDictionary *)dataDic; // 初始化方法

@end
