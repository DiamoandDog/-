//
//  PhotoCollectionView.h
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSArray *bigURLArray;
@property (nonatomic, strong) NSArray *largeURLArray;

@end
