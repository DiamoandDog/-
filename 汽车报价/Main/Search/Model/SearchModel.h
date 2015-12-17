//
//  SearchModel.h
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseModel.h"

@interface SearchModel : BaseModel

@property(nonatomic,copy)NSString *imageurl;//图片地址
@property(nonatomic,copy)NSString *seriesname;//车名
@property(nonatomic,retain)NSNumber *minprice;//最低价
@property(nonatomic,retain)NSNumber *maxprice;//最高价
@property(nonatomic,copy)NSString *fctname;//品牌名
@property(nonatomic,copy)NSString *levelname;//车类型名
@property(nonatomic,retain)NSNumber *speccount;//符合条件的车型数量

@property(nonatomic,retain)NSNumber *seriesid;//符合条件车型的请求参数

@end
