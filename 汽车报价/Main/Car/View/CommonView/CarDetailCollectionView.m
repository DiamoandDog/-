//
//  CarDetailCollectionView.m
//  汽车报价
//
//  Created by Fred on 15/10/8.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarDetailCollectionView.h"
#import "DealerHomeViewController.h"
#import "UIView+GetViewController.h"

static NSString *cellIdentify = @"cell";

@implementation CarDetailCollectionView
{
    NSArray *_titileArray;
}

#pragma mark -
#pragma mark Initialization collectionTableView
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        // Do additional setup
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentify];
        
        
        [self _customColltionView];
    }
    
    return self;
}


- (void)_customColltionView
{
    _titileArray = @[
                     @"配置",
                     @"经销商",
                     @"视频",
                     @"降价",
                     @"口碑",
                     @"评测",
                     @"提车贴",
                     @"行情",
                    
                     ];

    
    // Do nothing
}


#pragma mark -
#pragma mark UICollctionView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titileArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    
    
    //| ----------------------------------------------------------------------------------
    UILabel *cellTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((cell.width - 60.0) / 2.0, (cell.height - 20.0 ) / 2.0, 50.0, 20.0)];
    
    cellTitleLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    cellTitleLabel.textAlignment = NSTextAlignmentCenter;
    cellTitleLabel.font = [UIFont systemFontOfSize:15];
    
    cellTitleLabel.text = _titileArray[indexPath.row];
    
    
    [cell.contentView addSubview:cellTitleLabel];
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


#pragma mark -
#pragma mark UICollectionView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((KScreenWidth - 4) / 4, 49.5);
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            DealerHomeViewController *dealerHomeCtrl = [[DealerHomeViewController alloc] init];
            [[self getNavigationController] pushViewController:dealerHomeCtrl animated:YES];

        }
            break;

        case 2:
        {
            
        }
            break;

        case 3:
        {
            
        }
            break;

        case 4:
        {
        }
            break;

        case 5:
        {
            
        }
            break;

        case 6:
        {
            
        }
            break;

            
        default:
            break;
    }
    NSLog(@"😄不好意思,暂且没实现😄");
    NSLog(@"row:%ldsection:%ld",indexPath.row,indexPath.section);
}

@end
