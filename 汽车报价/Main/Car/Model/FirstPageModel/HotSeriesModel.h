//
//  HotSeriesModel.h
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface HotSeriesModel : BaseModel
/*
"hotseries":[
             {
                 "seriesname":"瑞虎5",
                 "salestate":1,
                 "serieslogo":"http://baojia0.autoimg.cn/bj/2015082223/253630144_1440258701223.png",
                 "seriesid":3195
             },
             Object{...},*/

@property (nonatomic, copy) NSString *seriesname;
@property (nonatomic, strong) NSNumber *salestate;
@property (nonatomic, copy) NSString *serieslogo;
@property (nonatomic, strong) NSNumber *seriesid;






@end
