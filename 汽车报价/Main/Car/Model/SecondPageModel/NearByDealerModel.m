//
//  NearByDealerModel.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "NearByDealerModel.h"
#import "NearByDealerListModel.h"

@implementation NearByDealerModel

-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        
        _pageindex = dic[@"pageindex"];
        
        _ListModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"list"]) {
            
            NearByDealerListModel *model = [[NearByDealerListModel alloc] initModelDataWithJsonDic:d];
            
            [_ListModelArray addObject:model];
            
        }
        
    }
    
    return self;
}

@end
