//
//  ImageCell.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModle.h"


@interface ImageCell : UICollectionViewCell

@property (nonatomic, strong) ListModle *model;

@property (weak, nonatomic) IBOutlet UIImageView *cellBgImageView;
@end
