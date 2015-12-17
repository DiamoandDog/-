//
//  SimilarViewController.h
//  汽车报价
//
//  Created by mac on 15/9/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface SimilarViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *dataArray;

@end
