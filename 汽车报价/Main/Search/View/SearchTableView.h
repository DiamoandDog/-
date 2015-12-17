//
//  SearchTableView.h
//  汽车报价
//
//  Created by mac on 15/9/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PassBlock)(NSString*,NSInteger);

@interface SearchTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy)PassBlock block;
@end
