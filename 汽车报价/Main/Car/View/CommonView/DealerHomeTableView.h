//
//  DealerHomeTableView.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealerHomeTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

//|-----------------------------------------------------------------------------------
//!Data from the DealerHomePageViewController

@property (nonatomic, strong) NSArray *dealerHomeTableModelArray;



@end
