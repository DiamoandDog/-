//
//  BaseCollectionVeiw.m
//  汽车报价
//
//  Created by Fred on 15/9/27.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseCollectionVeiw.h"

@implementation BaseCollectionVeiw

#pragma mark -
#pragma mark initialization methods
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        //
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //
    self.delegate = self;
    self.dataSource = self;
}


#pragma mark -
#pragma mark UICollectionView DataSource (Default)
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Default cell is nil.
    // The subclass can override the methods to modify self cells;
    return nil;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // Default number rows in section is six.
    // The subclass can override the methods to modify self number rows in section ;
    return 0;
}



#pragma mark - 
#pragma mark - UICollectionView Delegate (Default)
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//!

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return CGSizeMake(50, 50);
    
}

//单元格相对于屏幕边缘的间隙
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    
//    
//    return UIEdgeInsetsMake(0,(KScreenWidth - self.width) / 2, 0, (KScreenWidth - self.width) / 2);
//    
//}




#pragma mark -
#pragma mark UIScrollView Delegate  - for Custom page effect
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//手指将要离开视图时,自定义分页效果
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    
//    /*
//     velocity:速度
//     targetContentOffset:目标偏移量
//     */
//    
//    //单元格宽度
//    CGFloat itmeWidth = self.width;
//    
//    CGFloat x = targetContentOffset ->x;
//    //计算最终会停留在第几页
//    NSInteger index = (x + itmeWidth / 2) / itmeWidth;
//    
//    //改变最终偏移量
//    targetContentOffset -> x = index * itmeWidth;
//    
//    //更新当前页 触发KVO
//    self.currentIndex = index;
//    //NSLog(@"%ld",self.currentIndex);//test😊😊😊😊😊test😊😊😊😊😊test
//    
//}



@end
