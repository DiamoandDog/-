//
//  BrandListModel.h
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface BrandListModel : BaseModel
/*
"brandlist":[
             {
                 "letter":"A",
                 "list":[
                         {
                             "id":35,
                             "name":"阿斯顿·马丁",
                             "imgurl":"http://x.autoimg.cn/app/image/brands/35.png",
                             "brandid":35,
                             "firstletter":"A"
                         },
                         Object{...},*/

@property (nonatomic, strong) NSNumber *carId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, strong) NSNumber *brandid;
@property (nonatomic, copy) NSString *firstletter;





@end
