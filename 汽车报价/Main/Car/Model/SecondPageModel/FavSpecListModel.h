//
//  FavSpecListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface FavSpecListModel : BaseModel
/*
"speclist":[
            {
                "salestate":1,
                "seriesid":168,
                //"seriesname":"Boxster",
                "specid":22394,
                //  "specname":"2015款 Boxster Style Edition 2.7L",
                // "fctprice":"74.70",
                //"dealerprice":"74.70",
                "dealerid":107911,
                // "imgurl":"http://car0.autoimg.cn/car/upload/2015/4/20/m_20150420231719324-1110.jpg",
                "istaxoff":0,
                // "cityname":"",
                "priceclass":null,
                "pricedetails":{
                    "referenceprice":"83.27",
                    ]
                }
 */

@property (nonatomic, copy) NSString *seriesname;
@property (nonatomic, copy) NSString *specname;
@property (nonatomic, copy) NSString *fctprice;
@property (nonatomic, copy) NSString *dealerprice;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *cityname;




@end
