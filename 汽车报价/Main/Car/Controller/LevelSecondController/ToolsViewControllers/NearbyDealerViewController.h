//
//  NearbyDealerViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "NearByDealerTableView.h"

@interface NearbyDealerViewController : BaseViewController

@property (nonatomic, strong) NearByDealerTableView *dealerTableView;

// data from the network request
@property (nonatomic, strong) NSMutableArray *dealerModelArray;
@end
