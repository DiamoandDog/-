//
//  BaseModel.h
//  汽车报价
//
//  Created by Fred on 15/9/24.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject



- (instancetype)initModelDataWithJsonDic:(NSDictionary *)jsonDic;

- (NSDictionary *)modelAttributesMapJsonDictionaryKey;



@end
