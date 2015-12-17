//
//  BrandListModel.m
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BrandListModel.h"

@implementation BrandListModel


// override the methods of super class
- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{

    NSDictionary *mapdic = @{
                             @"carId":@"id",
                             @"name":@"name",
                             @"imgurl":@"imgurl",
                             @"brandid":@"brandid",
                             @"firstletter":@"firstletter"
                             
                             };
    return mapdic;
}

@end
