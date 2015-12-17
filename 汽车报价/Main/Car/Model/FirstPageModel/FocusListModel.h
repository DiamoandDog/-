//
//  FocusListModel.h
//  汽车报价
//
//  Created by Fred on 15/9/27.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@interface FocusListModel : BaseModel

/*
{
    "returncode":0,
    "message":"ok",
    "result":{
        "focusList":[
                     {
                         "focusnewsurl":"http://m.mall.autohome.com.cn/detail/32829-110100-0.html?pvareaid=105536",
                         "focusimageurl":"http://baojia0.autoimg.cn/bj/2015091923/1414280274_1442676993185.jpg"
                     },
                     Object{...},
                     Object{...},
                     Object{...},
                     Object{...}
                     ]
    }
*/


@property (nonatomic, copy) NSString *foucusImageURL;
@property (nonatomic, copy) NSString *foucusNewsURL;


- (instancetype)initWithJsonDataDictionary:(NSDictionary *)JsonDic;


@end
