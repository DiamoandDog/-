//
//  FocusCell.h
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FocusCell : UICollectionViewCell<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *headerscrollView;



//| ----------------------------------------------------------------------------------
//!Data from the CarHeaderCollectinView
@property (nonatomic, strong) NSArray *focusListCollectionCellModelArray;


@end
