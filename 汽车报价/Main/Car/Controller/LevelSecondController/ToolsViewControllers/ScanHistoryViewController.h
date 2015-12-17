//
//  ScanHistoryViewController.h
//  汽车报价
//
//  Created by Fred on 15/9/30.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "ScanHistoryTableView.h"

@interface ScanHistoryViewController : BaseViewController
{
    ScanHistoryTableView *subTableView;
}


@property (nonatomic, strong) NSNumber *scanCount;

// Data from don't konw
@property (nonatomic, strong) NSMutableArray *scanHistoryModleArray;

@end
