//
//  EnginListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecListModel.h"

@interface EnginListModel : NSObject

/*"enginelist":[
              {
                  "type":"0x000c",
                  "name":"1.8升 涡轮增压 160马力",
                  "paramisshow":1,
                  "isclassic":0,
                  "enginepower":160,
                  "avgState":25,
                  "displacement":1.8,
                  "speclist":Array[4]
              },*/


@property (nonatomic, copy) NSString *sectionName;


//| ----------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *sepcListModelArray;


- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end







