//
//  SecondSectionModel.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondSectionModel : NSObject

/*
    "returncode":0,
    "message":"ok",
    "result":{
        "fctlist":[
                   {
                       "name":"北京现代",
                       "serieslist":Array[12]
                   },
                   {
                       "name":"四川现代",
                       "serieslist":Array[1]
                   },
                   Object{...}
 */

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *secondModleArray;


- (instancetype)initWithDictionary:(NSDictionary *)dic;


@end
