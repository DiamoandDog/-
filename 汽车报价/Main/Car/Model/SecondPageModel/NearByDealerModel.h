//
//  NearByDealerModel.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NearByDealerModel : NSObject

//|-----------------------------------------------------------------------------------
//!The data structure

/*
    "returncode":0,
    "message":"",
    "result":{
        "rowcount":23042,
        "pagecount":2305,
        "pageindex":1,
        "list":Array[10]
 */

@property (nonatomic, strong) NSNumber       *rowcount;
@property (nonatomic, strong) NSNumber       *pagecount;
@property (nonatomic, strong) NSNumber       *pageindex;
@property (nonatomic, strong) NSMutableArray *ListModelArray;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
