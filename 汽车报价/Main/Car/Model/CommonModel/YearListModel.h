//
//  YearListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//
#import "BaseModel.h"
#import "EnginListModel.h"

@interface YearListModel : BaseModel

/*
"yearlist":[
            {
                "id":1,
                "name":"全部在售"
            },
            {
                "id":2016,
                "name":"2016款"
            },
            {
                "id":2015,
                "name":"2015款"
            },
            {
                "id":3,
                "name":"停售"
            }
            ],
*/


@property (nonatomic, copy) NSString *name;






@end
