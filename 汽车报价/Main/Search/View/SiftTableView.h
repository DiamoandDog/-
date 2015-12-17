//
//  SiftTableView.h
//  汽车报价
//
//  Created by mac on 15/9/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiftTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *modelArray;
@property(nonatomic,strong)NSMutableDictionary *params;

@end
