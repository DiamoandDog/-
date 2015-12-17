//
//  FavDealerModel.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface FavDealerModel : BaseModel

//|-----------------------------------------------------------------------------------
//!The data structure

/*{
    "returncode":0,
    "message":"",
    "result":{
        "dealerlist":[
                      {
                         // "dname":"杭州元福汽车",
                          "dphone":"4009317350",
                          "did":110466,
                          "bicon":"http://car0.autoimg.cn/logo/fct/100/129828476291631437.jpg",
                         // "imgUrl":"http://car0.autoimg.cn/carnews/2013/6/8/272x204_0_q87_201306081934006574218.jpg",
                          "bname":"福特",
                          "onsalecount":0,
                          "is24":1,
                          "isAuth":1,
                        // "businessarea":"售本省",
                        //  "address":"浙江省杭州市杭海路1605号",
                          "pavclass":null
                      }
                      ]
 */

@property (nonatomic, copy) NSString *dname;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *businessarea;
@property (nonatomic, copy) NSString *address;




@end
