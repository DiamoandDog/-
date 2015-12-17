//
//  EnginListModel.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "EnginListModel.h"

@implementation EnginListModel


- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        _sectionName = dic[@"name"];
        
        _sepcListModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"speclist"]) {
            
            
            SpecListModel *model = [[SpecListModel alloc] initModelDataWithJsonDic:d];
            
            [_sepcListModelArray addObject:model];
        }
        
        
    }
    
    return self;
}
@end
