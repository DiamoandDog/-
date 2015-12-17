//
//  HotBrandsModel.m
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "HotBrandsModel.h"

@implementation HotBrandsModel


// override the methods of super class
- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{
   
    NSDictionary *mapdic = @{
                             @"firstletter":@"firstletter",
                             @"carId":@"id",
                             @"imgurl":@"imgurl",
                             @"name":@"name",
                             @"brandid":@"brandid"
                             
                             };
    return mapdic;
}

@end
