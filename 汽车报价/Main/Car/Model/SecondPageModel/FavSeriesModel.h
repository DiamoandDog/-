//
//  FavSeriesModel.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface FavSeriesModel : BaseModel

//|-----------------------------------------------------------------------------------
//!The data structure

/*{
    "returncode":0,
    "message":"",
    "result":{
        "serieslist":[
                      {
                          "seriesid":3170,
                         // "seriesname":"奥迪A3",
                          //"fctprice":"18.49-29.67",
                         // "levelname":"紧凑型车",
                         // "fctname":"一汽-大众奥迪",
                         // "imgurl":"http://car0.autoimg.cn/car/upload/2015/4/26/m_201504262235149784971112.jpg",
                          "pavclass":null,
                          "salestate":1
                      },
                      Object{...},
                      Object{...},
                      Object{...},
                      Object{...},
                      Object{...}
                      ]
    }

*/


@property (nonatomic, copy  ) NSString *seriesid;
@property (nonatomic, copy  ) NSString *seriesname;
@property (nonatomic, copy  ) NSString *fctprice;
@property (nonatomic, copy  ) NSString *levelname;
@property (nonatomic, copy  ) NSString *fctname;
@property (nonatomic, copy  ) NSString *imgurl;
@property (nonatomic, copy  ) NSString *salesstate;




@end












