//
//  MyColletionTableView.h
//  汽车报价
//
//  Created by Fred on 15/10/5.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseTabeView.h"

@interface MyColletionTableView : BaseTabeView

//The flag for loading diffrent cell
@property (nonatomic, assign) NSInteger flag;


// The data from the MyColletionViewController
@property (nonatomic, strong) NSArray *myColletionTableModelArray;

@end
