//
//  CarDetailModel.h
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearListModel.h"

@interface CarDetailModel : NSObject

//|-----------------------------------------------------------------------------------
//!The data structure

/*
{
    "returncode":0,
    "message":"",
    "result":{
        "name":"奥迪A4L",
        "logo":"http://car0.autoimg.cn/upload/2014/7/17/k_201407172038052834971.jpg",
        "piccount":8888,
        "videocount":23,
        "fctname":"一汽-大众奥迪",
        "levelname":"中型车",
        "fctprice":"27.28-57.81",
        "countryname":"",
        "stopspecnum":38,
        "displacement":"",
        "transmission":"",
        "brandlogo":"http://car0.autoimg.cn/logo/brand/100/129472203719848750.jpg",
        "mallurl":"",
        "malltitle":"",
        "hjkactivity":null,
        "floorprice":null,
        "miniprice":"23.70",
        "yearlist":Array[4],
        "tuan":null,
        "mall":null,
        "enginelist":Array[4]
    }
}
 */

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *logo;
@property (nonatomic, strong) NSNumber *piccount;
@property (nonatomic, strong) NSNumber *videocount;
@property (nonatomic, copy) NSString *fctname;
@property (nonatomic, copy) NSString *levelname;
@property (nonatomic, copy) NSString *fctprice;


//| ----------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *yearlistModleArray;
@property (nonatomic, strong) NSMutableArray *enginelistModleArray;


- (instancetype)initWithDictionary:(NSDictionary *)dic;


@end











