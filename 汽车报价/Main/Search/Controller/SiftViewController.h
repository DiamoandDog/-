//
//  SiftViewController.h
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface SiftViewController : BaseViewController

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,copy)NSString *session;
@property(nonatomic,strong)NSMutableDictionary *params;
@end
