//
//  ScanHistoryTableView.h
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanHistoryTableView : UITableView<UITableViewDataSource,UITableViewDelegate>


// The data from ScanHistoryViewController
@property (nonatomic, strong) NSArray *sanHistoryTableModelArray;

@end
