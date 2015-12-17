//
//  SaleListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface SaleListModel : BaseModel

//|-----------------------------------------------------------------------------------
//!The data structure

/*"name":"小型车",
"serieslist":[
              {
                  "id":145,
                  "name":"POLO",
                  "imgurl":"http://car0.autoimg.cn/upload/2014/8/6/s_20140806072335496497111.jpg",
                  "price":"7.59-15.89",
                  "ordercount":52601
              },
              Object{...},
*/

@property (nonatomic, copy) NSString *seriesId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, strong) NSNumber *ordercount;

@end
