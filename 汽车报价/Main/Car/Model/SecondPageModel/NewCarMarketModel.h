//
//  NewCarMarketModel.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface NewCarMarketModel : BaseModel

//|-----------------------------------------------------------------------------------
//!NewCars  data structure

/*
    "result":{
        "rowcount":149,
        "pagecount":8,
        "pageindex":1,
        "serieslist":[
                      {
                          "id":69,
                          "name":"揽胜",
                          "imgurl":"http://car0.autoimg.cn/car/upload/2015/1/5/s_20150105213312274497110.jpg",
                          "price":"149.80-329.80",
                          "salestate":1,
                          "newsurl":"http://cont.app.autohome.com.cn/autov4.5/content/news/newscontent-n879745-t0.html",
                          "saletime":"2015-09-25",
                          "newstitle":"2016款揽胜售155.8万起"
                      },
                      Object{...},

*/
//|-----------------------------------------------------------------------------------
//!UpComingSales data structure

/*
    "result":{
        "serieslist":[
                      {
                          "id":3780,
                          "name":"宋",
                          "imgurl":"http://www0.autoimg.cn/zx/newspic/2015/9/25/400x300_0_2015092516162470488.jpg",
                          "price":"暂无报价",
                          "salestate":2,
                          "newsurl":"http://cont.app.autohome.com.cn/autov4.5/content/news/newscontent-n879768-t0.html",
                          "selltime":"2015年10月12日",
                          "newstitle":"查看比亚迪宋上市资讯"
                      },
                      Object{...},
 */
// NewCars
@property (nonatomic, copy) NSString *seriesId;
@property (nonatomic, copy) NSString *salestate;


@property (nonatomic, strong) NSNumber *rowcount;
@property (nonatomic, strong) NSNumber *pagecount;
@property (nonatomic, strong) NSNumber *pageindex;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *newsurl;
@property (nonatomic, copy) NSString *saletime;
@property (nonatomic, copy) NSString *newstitle;

// UpComingSales
@property (nonatomic, copy) NSString *selltime;


@end
















