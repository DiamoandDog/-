//
//  ImageListViewController.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseViewController.h"
#import "ImageListCollectionView.h"

@interface ImageListViewController : BaseViewController
{
    ImageListCollectionView *subViewCollectionView;

}

@property (nonatomic, strong) NSMutableArray  *imageListModelArray;

@property (nonatomic, copy) NSString *seriesID;
@end
