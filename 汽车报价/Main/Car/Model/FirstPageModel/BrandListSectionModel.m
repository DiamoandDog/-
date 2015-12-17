//
//  BrandListSectionModel.m
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BrandListSectionModel.h"
#import "BrandListModel.h"


@implementation BrandListSectionModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        _sectionHeaderLetter = dic[@"letter"];

        _sectionBrandListArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"list"]) {
            
            BrandListModel *model = [[BrandListModel alloc] initModelDataWithJsonDic:d];
            
            [_sectionBrandListArray addObject:model];
        }
        
        
    }
    return self;
    
}


@end
