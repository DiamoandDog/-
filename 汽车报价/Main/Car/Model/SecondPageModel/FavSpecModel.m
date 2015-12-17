//
//  FavSpecModel.m
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "FavSpecModel.h"
#import "FavSpecListModel.h"

@implementation FavSpecModel


- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        
        _groupname = dic[@"groupname"];
        _salestate = dic[@"salestate"];
        _seriesid  = dic[@"seriesid"];
        
        
        
        //| ----------------------------------------------------------------------------------
        _favSpecListModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"speclist"]) {
        
            FavSpecListModel *model = [[FavSpecListModel alloc] initModelDataWithJsonDic:d];
            
            [_favSpecListModelArray addObject:model];
        }
    }
    return self;
}

@end
