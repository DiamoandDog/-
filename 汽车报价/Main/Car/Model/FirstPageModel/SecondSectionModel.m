//
//  SecondSectionModel.m
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "SecondSectionModel.h"
#import "SecondModel.h"


@implementation SecondSectionModel


-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        // Do additional setup - for custom model
        _name = dic[@"name"];
        
        _secondModleArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"serieslist"]) {
            
            SecondModel *modle = [[SecondModel alloc] initModelDataWithJsonDic:d];
            
            [_secondModleArray addObject:modle];
            
        }
        
    }
    
    return self;
}

@end
