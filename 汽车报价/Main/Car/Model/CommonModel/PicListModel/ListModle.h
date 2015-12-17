//
//  ListModle.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface ListModle : BaseModel
/*"list":[
        {
            "id":"3143187",
            "smallpic":"http://car2.autoimg.cn/cardfs/product/g4/M11/7C/5C/t_autohomecar__wKgHy1X4riGAQafzAAnKw0mkuk0367.jpg",
            "specid":"21562",
            "specname":"2015款 2.0T GTDi 四驱尊锐型",
            "membername":"",
            "isuserup":0
        },
        {
            "id":"3143182",
            "smallpic":"http://car3.autoimg.cn/cardfs/product/g4/M11/7B/EE/t_autohomecar__wKjB01X4rh2AeZXLAAdO9uyuExE516.jpg",
            "specid":"21562",
            "specname":"2015款 2.0T GTDi 四驱尊锐型",
            "membername":"",
            "isuserup":0
*/

@property (nonatomic, copy) NSString *listId;
@property (nonatomic, copy) NSString *smallpic;
@property (nonatomic, copy) NSString *specid;

@end
