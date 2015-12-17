//
//  PhotoCollectionView.m
//  汽车报价
//
//  Created by Fred on 15/10/13.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"


static NSString *photoCellIdentify = @"PhotoCell";

@implementation PhotoCollectionView


#pragma mark -
#pragma mark Initialization and CustomCollectionView methods
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        self.pagingEnabled = YES;
        //| ----------------------------------------------------------------------------------
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:photoCellIdentify];
        
        [self _customCollectionView];
        
    }
    
    return self;
}


- (void)_customCollectionView
{
    
}


#pragma mark -
#pragma mark UICollectionView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _bigURLArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellIdentify forIndexPath:indexPath];
    
    cell.bigImageURL = _bigURLArray[indexPath.row];
    cell.largeImageURL = _largeURLArray[indexPath.row];
    
    return cell;
}


#pragma mark -
#pragma mark UICollectionView Delegaet
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(KScreenWidth , KScreenHeight - KNavigationBarHeight);
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIScrollView *view = (UIScrollView *)[cell viewWithTag:2000];
    view.zoomScale = 1;
    
}


#pragma mark -
#pragma mark Override setter methods for reload
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
-(void)setBigURLArray:(NSArray *)bigURLArray
{
    if (_bigURLArray != bigURLArray) {
        
        _bigURLArray = bigURLArray;
        
        [self reloadData];
    }
}

-(void)setLargeURLArray:(NSArray *)largeURLArray
{
    if (_largeURLArray != largeURLArray) {
        
        _largeURLArray = largeURLArray;
        
        [self reloadData];
    }
}
@end





















