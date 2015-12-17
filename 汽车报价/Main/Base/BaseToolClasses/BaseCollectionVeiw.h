//
//  BaseCollectionVeiw.h
//  汽车报价
//
//  Created by Fred on 15/9/27.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionVeiw : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)CGFloat cellWidth; //单元格宽度

@property(nonatomic,assign)NSInteger currentIndex;//当前页



@end
