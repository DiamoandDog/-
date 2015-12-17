//
//  NewCarsMarketViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "NewCarMarketTableView.h"


@interface NewCarsMarketViewController : BaseViewController

@property (nonatomic, strong) NewCarMarketTableView *currentTableView;

//Data from the network request
@property (nonatomic, strong) NSMutableArray *marketModleArray;



@end
