//
//  SecondModel.h
//  汽车报价
//
//  Created by Fred on 15/10/3.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface SecondModel : BaseModel

/*"serieslist":[
              {
                  "id":2115,
                  "name":"瑞纳",
                  "imgurl":"http://car0.autoimg.cn/upload/2014/3/20/s_201403202033442545132.jpg",
                  "levelid":2,
                  "levelname":"小型车",
                  "price":"7.39-10.69",
                  "malltitle":"",
                  "mallurl":"",
                  "salestate":1,
                  "newsurl":"",
                  "newstitle":"",
                  "istuan":false,
                  "ishjk":false
              },
              Object{...},
 */


@property (nonatomic, copy) NSString *seriesId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, strong) NSNumber *salestate;


@end
