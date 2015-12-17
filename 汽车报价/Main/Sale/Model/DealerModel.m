//
//  DealerModel.m
//  汽车报价
//
//  Created by imac on 15/10/10.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "DealerModel.h"

@implementation DealerModel

-(instancetype) initWithDataDic:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        // model属性赋值
        self.dealerName = dataDic[@"dealername"];
        self.brandName = dataDic[@"brandname"];
        self.address = dataDic[@"address"];
        self.dealerPhone = dataDic[@"dealerphone"];
        self.businessArea = dataDic[@"businessarea"];
    }
    return self;
}


@end
