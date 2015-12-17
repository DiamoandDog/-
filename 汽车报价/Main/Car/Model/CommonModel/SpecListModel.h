//
//  SpecListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface SpecListModel : BaseModel

/*"speclist":[
            {
                "floorprice":false,
                "buttontitle":"底价购车",
                "pricedetails":null,
                "id":23922,
                "mallurl":"",
                "malltitle":"",
                "name":"2016款 30 TFSI 手动舒适型",
                "speclogo":"http://car2.autoimg.cn/cardfs/product/g7/M06/84/FC/autohomecar__wKgH3VX_stKAASZ_AAmmVty5Zn0323.jpg",
                "price":"27.28",
                "description":"前置前驱 6挡手动",
                "structure":"三厢车",
                "paramisshow":"1",
                "state":20,
                "ispreferential":0,
                "dealerid":5915,
                "dealername":"广西钜荣奥迪",
                "dealerphone":"4008307051",
                "dealerprice":"27.28",
                "dealerprovinceid":450000,
                "dealercityid":450100,
                "salestate":1,
                "membercount":"",
                "year":2016,
                "isnewspec":1,
                "countrysubsidy":"",
                "citysubsidy":""
            },
            Object{...},
*/


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *speclogo;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *dealerprice;
@property (nonatomic, copy) NSString *dealerid;
@property (nonatomic, copy) NSString *dealername;
@property (nonatomic, copy) NSString *dealerphone;
@property (nonatomic, copy) NSString *dealerprovinceid;
@property (nonatomic, copy) NSString *dealercityid;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, strong) NSNumber *isnewspec;

@property (nonatomic, strong) NSNumber *priceDetail;



@end
















