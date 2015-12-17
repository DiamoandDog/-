//
//  HotBrandsModel.h
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface HotBrandsModel : BaseModel
/*
"hotbrandlist":[
                {
                    "firstletter":"D",
                    "id":1,
                    "imgurl":"http://x.autoimg.cn/app/image/brands/1.png",
                    "name":"大众",
                    "brandid":1
                },
                Object{...},*/

@property (nonatomic, copy) NSString *firstletter;
@property (nonatomic, strong) NSNumber *carId;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *brandid;




@end
