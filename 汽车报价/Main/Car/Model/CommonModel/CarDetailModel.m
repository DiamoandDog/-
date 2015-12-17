//
//  CarDetailModel.m
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarDetailModel.h"

@implementation CarDetailModel


- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        _name = dic[@"name"];
        _logo = dic[@"logo"];
        _piccount = dic[@"piccount"];
        _videocount = dic[@"videocount"];
        _fctname = dic[@"fctname"];
        _levelname = dic[@"levelname"];
        _fctprice = dic[@"fctprice"];
        
        
        //| ----------------------------------------------------------------------------------
        _yearlistModleArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"yearlist"]) {
            
            YearListModel *model = [[YearListModel alloc] initModelDataWithJsonDic:d];
            
            [_yearlistModleArray addObject:model];
        }
       
        _enginelistModleArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"enginelist"]) {
            
            EnginListModel *mode = [[EnginListModel alloc] initWithDictionary:d];
            
            [_enginelistModleArray addObject:mode];
        }
        
    }
    
    
    
    return self;
}
@end
