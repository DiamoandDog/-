//
//  PicTypeListModle.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface PicTypeListModle : BaseModel
/*
"typelist":[
            {
                "id":1,
                "name":"外观",
                "piccount":95
            },
            {
                "id":10,
                "name":"中控",
                "piccount":268
            },
            {
                "id":3,
                "name":"座椅",
                "piccount":368
            },
            {
                "id":12,
                "name":"其他",
                "piccount":465
            },
 */

@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *piccount;



@end
