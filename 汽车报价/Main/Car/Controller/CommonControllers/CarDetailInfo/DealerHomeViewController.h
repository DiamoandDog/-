//
//  DealerHomeViewController.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "DealerHomeTableView.h"

@interface DealerHomeViewController : BaseViewController
{
    DealerHomeTableView *subViewTableView;
}





//|-----------------------------------------------------------------------------------
//!Data from push
@property (nonatomic, copy) NSString *dealerID;

//!Data from network
@property (nonatomic, strong) NSMutableArray *dealeHomePageModelArray;

@end
