//
//  CarTableView.h
//  汽车报价
//
//  Created by Fred on 15/9/25.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseTabeView.h"
#import "CJRefreshTableHeaderView.h"


@interface CarTableView : BaseTabeView


//| ----------------------------------------------------------------------------------
// The data from CarViewController
@property (nonatomic, strong) NSArray *focusListTableModelArray;
@property (nonatomic, strong) NSArray *hotBrandsTableModelArray;
@property (nonatomic, strong) NSArray *hotSeriesTableModelArray;
@property (nonatomic, strong) NSArray *brandListsectonTableModelArray;



@end
