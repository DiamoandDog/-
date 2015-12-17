//
//  NewCarMarketModel.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NewCarMarketModel.h"

@implementation NewCarMarketModel



- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{
    
    NSDictionary *mapDic = @{
                             @"seriesId":@"id",
                             @"salestate":@"salestate",
                             @"rowcount":@"rowcount",
                             @"pagecount":@"pagecount",
                             @"pageindex":@"pageindex",
                             @"name":@"name",
                             @"imgurl":@"imgurl",
                             @"price":@"price",
                             @"newsurl":@"newsurl",
                             @"saletime":@"saletime",
                             @"newstitle":@"newstitle",
                             @"selltime":@"selltime"
                             
                             
                             };
    return mapDic;
}

@end
