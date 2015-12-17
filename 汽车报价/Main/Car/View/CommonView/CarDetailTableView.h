//
//  CarDetailTableView.h
//  汽车报价
//
//  Created by Fred on 15/10/4.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarDetailTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


//Data from the CarDetailInfoViewController
@property (nonatomic, strong) NSArray *detailInfoTableModelArray;

@property (nonatomic, copy) NSString *seriesID;

@end
