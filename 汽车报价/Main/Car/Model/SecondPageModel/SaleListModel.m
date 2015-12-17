//
//  SaleListModel.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SaleListModel.h"

@implementation SaleListModel


-(NSDictionary *)modelAttributesMapJsonDictionaryKey
{
    NSDictionary *mapDic = @{
                             @"seriesId":@"id",
                             @"name":@"name",
                             @"imgurl":@"imgurl",
                             @"price":@"price",
                             @"ordercount":@"ordercount"
                             
                             };
    return mapDic;
}

@end
