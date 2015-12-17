//
//  SecondModel.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel


- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{
    NSDictionary *mapdic = @{
                             @"seriesId":@"id",
                             @"name":@"name",
                             @"imgurl":@"imgurl",
                             @"pirce":@"price",
                             @"salestate":@"salestate"
                             
                             };
    return mapdic;

}
@end
