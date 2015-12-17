//
//  NearByDealerListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface NearByDealerListModel : BaseModel
//|-----------------------------------------------------------------------------------
//!The data structure

/*"pageindex":1,
"list":[
        {
            "address":"杭州市下沙路551号",
           // "brandimgurl":"http://car3.autoimg.cn/cardfs/fct/50/g6/M04/48/100/autohomecar__wKgH3FXSDCmAAp_DAAAS4rlzoMc084.jpg",
            "brandname":"大众",
            "dealerid":82194,
           // "dealername":"杭州元通宝通",
            "dealerimage":"",
            "dealerphone":"4009302409",
            "is24":"1",
            "isauth":"1",
           // "businessarea":"售全国",
            "lat":30.303766,
            "lon":120.31293,
            "isshowdistance":1,
            "newstitle":"捷达限时优惠高达1.2万元 欢迎垂询",
            "newsid":39745631,
            "newstype":0,
            "price":"",
            "ishjkdealer":false,
            "smsreply":0,
            "hjkmaxdiscount":"",
           // "distance":"3.56"
        },
        Object{...},
        Object{...},
 */


//@property (nonatomic, copy  ) NSString *address;
@property (nonatomic, copy  ) NSString *brandimgurl;
//@property (nonatomic, copy  ) NSString *brandname;
//@property (nonatomic, strong) NSNumber *dealerid;
@property (nonatomic, copy  ) NSString *dealername;
//@property (nonatomic, copy  ) NSString *dealerphone;
@property (nonatomic, copy  ) NSString *businessarea;
//@property (nonatomic, strong) NSNumber *lat;
//@property (nonatomic, strong) NSNumber *lon;
//@property (nonatomic, copy  ) NSString *newstitle;
@property (nonatomic, copy  ) NSString *distance;


@end
