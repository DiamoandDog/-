//
//  SaleViewController.h
//  汽车报价
//
//  Created by imac on 15/9/24.
//  Copyright (c) 2015年 丁彬男. All rights reserved.
//

#import "BaseViewController.h"
#import "SaleTableView.h"
#import "DealerTableView.h"
@interface SaleViewController : BaseViewController
{
    SaleTableView *_saleTableView;
    DealerTableView *_dealerTableView;
    UISegmentedControl *_topSegment;
    UISegmentedControl *_nextSegment;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@end
