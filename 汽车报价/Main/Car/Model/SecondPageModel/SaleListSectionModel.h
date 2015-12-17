//
//  SaleListSectionModel.h
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaleListSectionModel : NSObject


//|-----------------------------------------------------------------------------------
//!Data structure

/*{
    "returncode":0,
    "message":"",
    "result":{
        "hotcarlist":[
                      {
                          "name":"小型车",
                          "serieslist":Array[10]
                      },
 */

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *sectionModelArray;


- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
