//
//  NewListSectionModel.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SaleListSectionModel.h"
#import "SaleListModel.h"

@implementation SaleListSectionModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        // Do additional setup for analyzer 
        _name = dic[@"name"];
        
        _sectionModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"serieslist"]) {
            
            SaleListModel *model = [[SaleListModel alloc] initModelDataWithJsonDic:d];
            
            [_sectionModelArray addObject:model];
        }
        
        
    }
    
    return self;
}


@end
