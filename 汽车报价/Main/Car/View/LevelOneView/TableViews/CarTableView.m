//
//  CarTableView.m
//  汽车报价
//
//  Created by Fred on 15/9/25.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CarTableView.h"
#import "FocusListModel.h"
#import "BrandListSectionModel.h"
#import "BrandListModel.h"
#import "BrandListCell.h"
#import "CarHeaderCollectionView.h"
#import "UIView+GetViewController.h"
#import "CarViewController.h"
#import "SecondView.h"

static NSString *brandsListIdentify = @"BrandsListTableViewCell";

@implementation CarTableView

{
    CarHeaderCollectionView *_headerCollectionView;
    NSArray *_arrayHeadTitle;
    

}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Open touchView for Refresh
        [self customRefreshTypeWithRefreshDown:NO RefreshUp:NO RefrehTouchView:YES RefreshTouchPoint:NO];
        
        // Do modify for your self tableView
        [self customCarTableView];
        
    }
    return self;
}



#pragma mark -
#pragma mark Private method - Custom tableVIew
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)customCarTableView
{
    

    //| ----------------------------------------------------------------------------------
    // The Array for index
    _arrayHeadTitle =@[@"*",@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",
                       @"W",@"X",@"Y",@"Z"];
    
    self.sectionIndexBackgroundColor = [UIColor clearColor];
    self.sectionIndexColor = [UIColor darkGrayColor];
    self.sectionIndexTrackingBackgroundColor = [UIColor grayColor];
    

    

    //|-----------------------------------------------------------------------------------
    //!Register tableViewcells
    //FirstCell
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FirstCell"];
    
    //OtherCell
    UINib * brandListNib = [UINib nibWithNibName:@"BrandListCell" bundle:[NSBundle mainBundle]];
    
    [self registerNib:brandListNib forCellReuseIdentifier:brandsListIdentify];
    
}




#pragma mark - DataSource and Delegate
#pragma mark -
#pragma mark UITableView DataSource
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _brandListsectonTableModelArray.count + 1;
    ;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        
        return 1;
        
    }
    else
    {
    BrandListSectionModel *sectionModel = [[BrandListSectionModel alloc] init];
    
    sectionModel = _brandListsectonTableModelArray[section - 1];

    return  sectionModel.sectionBrandListArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        UITableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell"];
        
        //|-----------------------------------------------------------------------------------
        //!Create UICollectionView for FirstCell's subViews
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0);
        
        _headerCollectionView = [[CarHeaderCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , 530) collectionViewLayout:flowLayout];
        
        _headerCollectionView.backgroundColor = [UIColor  colorWithWhite:0.9 alpha:1.0];
        _headerCollectionView.scrollEnabled = NO;

               
        
        [firstCell insertSubview:_headerCollectionView aboveSubview:firstCell.contentView];
        
        return firstCell;
    }
    else
    {
        
    BrandListCell *cell = [tableView dequeueReusableCellWithIdentifier:brandsListIdentify forIndexPath:indexPath];

    BrandListSectionModel *sectionModel = [[BrandListSectionModel alloc] init];
    
    sectionModel = _brandListsectonTableModelArray[indexPath.section - 1];
    
    cell.model = sectionModel.sectionBrandListArray[indexPath.row];
        
    return cell;

    }

    
    
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//Create an index for tableView

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    NSString *string = _arrayHeadTitle[section];
    
    
    return string;
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return  _arrayHeadTitle;
    
    
}


#pragma mark -
#pragma mark UITableView Delegate
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0)
    {
        
        return 530;
        
    }
    else
    {
        
    return  60;
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0;
        
    }
    else
    {
        
        return 35;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return nil;
    }
    else
    {
        
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 35)];
    
    view.backgroundColor = [UIColor whiteColor];
    
    
    //| ----------------------------------------------------------------------------------
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width - 20 , 35)];

    BrandListSectionModel *sectionModel = [[BrandListSectionModel alloc] init];
    sectionModel = _brandListsectonTableModelArray[section - 1 ];
    
    sectionLabel.font = [UIFont systemFontOfSize:16];
    sectionLabel.backgroundColor = [UIColor clearColor];
    sectionLabel.text = sectionModel.sectionHeaderLetter;
    sectionLabel.textColor = [UIColor darkGrayColor];
    
    [view addSubview:sectionLabel];
    
    return view;
        
    }
}





//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 0) {
        
        
        //|-----------------------------------------------------------------------------------
        //!The flag for Loading SecondView data
        
        BrandListSectionModel *sectionModel = [[BrandListSectionModel alloc] init];
        
        sectionModel = _brandListsectonTableModelArray[indexPath.section - 1];
      
        BrandListModel *model = sectionModel.sectionBrandListArray[indexPath.row];
        
      
        
        //|-----------------------------------------------------------------------------------
        //!Get the secondView

         CarViewController *viewCtrl = (CarViewController *)[self getViewController];
        
         SecondView *secondView = viewCtrl.secondView;
        
        secondView.brandid = model.brandid;
        
        //|-----------------------------------------------------------------------------------
        //!Show secondView and pass data.
        
        [UIView animateWithDuration:0.4 animations:^{
            
            secondView.transform = CGAffineTransformMakeTranslation(-(KScreenWidth - 70), 0);
        }];

        
    }
}


#pragma mark -
#pragma mark UIScrollView Delegete
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    
    if (yOffset < 0) {
        scrollView.contentOffset = CGPointMake(0, 0);

    }
    
    
}






#pragma mark -
#pragma mark Override setter methods for reload data;
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************

- (void)setBrandListsectonTableModelArray:(NSMutableArray *)brandListsectonTableModelArray
{
    if (_brandListsectonTableModelArray != brandListsectonTableModelArray) {
        
        _brandListsectonTableModelArray = brandListsectonTableModelArray;
    
        [self reloadData];
            
            
        
    }
}

//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//Continue to pass data for UICollectionView for CarTableView.headerView
- (void)setFocusListTableModelArray:(NSArray *)focusListTableModelArray
{
    if (_focusListTableModelArray != focusListTableModelArray) {
        
        _focusListTableModelArray = focusListTableModelArray;
        
        _headerCollectionView.focusListCollectionModelArray = _focusListTableModelArray;

        
        
    }
}

- (void)setHotBrandsTableModelArray:(NSArray *)hotBrandsTableModelArray
{
    if (_hotBrandsTableModelArray != hotBrandsTableModelArray) {
        
        _hotBrandsTableModelArray = hotBrandsTableModelArray;
        
        _headerCollectionView.hotBrandsCollectionModelArray = _hotBrandsTableModelArray;
    }
}

- (void)setHotSeriesTableModelArray:(NSArray *)hotSeriesTableModelArray
{
    if (_hotSeriesTableModelArray != hotSeriesTableModelArray) {
        
        _hotSeriesTableModelArray = hotSeriesTableModelArray;
        
        _headerCollectionView.hotSeriesCollectionModelArray = _hotSeriesTableModelArray;
    }
}




@end










