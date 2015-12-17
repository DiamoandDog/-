//
//  ImageListCollectionView.m
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "ImageListCollectionView.h"
#import "PicListModel.h"
#import "ImageCell.h"
#import "ListModle.h"
//push
#import "UIView+GetViewController.h"
#import "PhotoViewController.h"


static NSString *imageCellIdentify = @"ImageCell";
static NSString *lastCellIdnetify = @"LastCell";

@implementation ImageListCollectionView
{
    PicListModel *_model;
}






- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self =[super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        
        
        
        
        //| ----------------------------------------------------------------------------------
        UINib *imageCell = [UINib nibWithNibName:@"ImageCell" bundle:[NSBundle mainBundle]];
        [self registerNib:imageCell forCellWithReuseIdentifier:imageCellIdentify];
        
        [self registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:lastCellIdnetify];
        
        
        [self _customCollectionView];
        
    }
    
    return self;
}


#pragma mark -
#pragma mark Custom UICollectionView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)_customCollectionView
{
}


#pragma mark -
#pragma mark UICollection DataSourece
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    _model = _imageURLModelCollectionArray[0] ;
    
    return  _model.listModelArray.count + 1.0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //| ----------------------------------------------------------------------------------
    
    if (indexPath.row == _model.listModelArray.count ) {
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:lastCellIdnetify forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        
        
        UIButton *lastRefreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        lastRefreshBtn.frame = CGRectMake(0, 0, KScreenWidth , 50);
        
        [lastRefreshBtn setTitle:@"点击加载更多" forState:UIControlStateNormal];
        
        [lastRefreshBtn addTarget:self action:@selector(lastRefreshBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        [cell addSubview:lastRefreshBtn];
        
        return cell;
    }
    else
    {
        ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCellIdentify forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor orangeColor];
        
        cell.model = _model.listModelArray[indexPath.row];
        return cell;


    }
    
    
    
}


- (void)lastRefreshBtnAction
{
    // Sending notification for loading more pics
    [[NSNotificationCenter defaultCenter] postNotificationName:KUICollectionLoadingMorePicNOtificationName object:nil];
    

}



#pragma mark - 
#pragma mark UICollection Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _model.listModelArray.count )
    {
        
        return CGSizeMake(KScreenWidth - 20, 50);
        
    }
    else
    {
    return CGSizeMake((KScreenWidth - 10 * 6) / 3, (KScreenWidth - 10 * 6 ) / 3);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *photoCtrl = [[PhotoViewController alloc] init];
    
    photoCtrl.indexPath = indexPath;
    
    
    NSMutableArray *bigImageUrlArray = [NSMutableArray array];
    NSMutableArray *largeImageUrlArray = [NSMutableArray array];
    
    for (ListModle *model in _model.listModelArray) {
        

        NSString *bigPic = [model.smallpic stringByReplacingOccurrencesOfString:_model.smallTag withString:_model.largeTag];
        
        NSString *largePic = [model.smallpic stringByReplacingOccurrencesOfString:_model.smallTag withString:_model.largeTag];
        
        
        [bigImageUrlArray addObject:bigPic];
        [largeImageUrlArray addObject:largePic];
        
    }
    
    photoCtrl.bigImageURLArray = bigImageUrlArray;
    photoCtrl.LargeImageURLArray = largeImageUrlArray;

    
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:photoCtrl];
    
    [[self getViewController] presentViewController:navi animated:YES completion:NULL];
}


#pragma mark -
#pragma mark Override Setter methods for relaodData
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)setImageURLModelCollectionArray:(NSArray *)imageURLModelCollectionArray
{
    if (_imageURLModelCollectionArray != imageURLModelCollectionArray) {
        
        _imageURLModelCollectionArray = imageURLModelCollectionArray;
        
        [self reloadData];
    }
}
@end















