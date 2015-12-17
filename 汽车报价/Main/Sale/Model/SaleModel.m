//
//  SaleModel.m
//  汽车报价
//
//  Created by imac on 15/9/25.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "SaleModel.h"

@implementation SaleModel

-(instancetype)initWithDataDic:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        
        // model属性赋值
        self.specName = dataDic[@"specname"];
        self.seriesName = dataDic[@"seriesname"];
        self.fctPrice = dataDic[@"fctprice"];
        self.tip = dataDic[@"tip"];
        self.dealerPrice = dataDic[@"dealerprice"];
        self.dealerShortName = dataDic[@"dealershortname"];
    }
    return self;
}


@end
