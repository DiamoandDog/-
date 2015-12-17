//
//  PicListModel.m
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "PicListModel.h"
#import "PicColorGroupModel.h"
#import "PicTypeListModle.h"
#import "PicSpeclistModel.h"
#import "ListModle.h"


@implementation PicListModel

//@property (nonatomic, copy) NSString *rowCount;
//@property (nonatomic, copy) NSString *pageIndex;
//@property (nonatomic, copy) NSString *bigTag;
//@property (nonatomic, copy) NSString *smallTag;
//@property (nonatomic, copy) NSString *largeTag;
//
//
////| ----------------------------------------------------------------------------------
//@property (nonatomic, strong) NSMutableArray *colorGroupModelArray;
//@property (nonatomic, strong) NSMutableArray *typeListModelArray;
//@property (nonatomic, strong) NSMutableArray *specListModleArray;
//@property (nonatomic, strong) NSMutableArray *listModelArray;



- (instancetype)initWithDictionay:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        _smallTag = dic[@"smalltag"];
        _bigTag = dic[@"bigtag"];
        _largeTag = dic[@"largetag"];
        
        
        //| ----------------------------------------------------------------------------------
        
        _typeListModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"typelist"]) {
            
            PicTypeListModle *model = [[PicTypeListModle alloc] initModelDataWithJsonDic:d];
            
            [_typeListModelArray addObject:model];
            
        }
        
        _listModelArray = [NSMutableArray array];
        
        for (NSDictionary *d in dic[@"list"]) {
            
            ListModle *model = [[ListModle alloc] initModelDataWithJsonDic:d];
            
            [_listModelArray addObject:model];
        }
        
        
    }
    return self;
}



@end
















