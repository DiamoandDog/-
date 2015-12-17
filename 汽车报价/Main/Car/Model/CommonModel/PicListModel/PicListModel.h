//
//  PicListModel.h
//  汽车报价
//
//  Created by Fred on 15/10/11.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicListModel : NSObject
/*"returncode":0,
 "message":"",
 "result":{
 "colorgroup":Array[1],
 "typelist":Array[6],
 "speclist":Array[7],
 "list":Array[60],
 "rowcount":95,
 "pagecount":2,
 "pageindex":1,
 "bigtag":"/w_",
 "smalltag":"/t_",
 "largetag":"/u_"
 */

@property (nonatomic, copy) NSString *rowCount;
@property (nonatomic, copy) NSString *pageIndex;
@property (nonatomic, copy) NSString *bigTag;
@property (nonatomic, copy) NSString *smallTag;
@property (nonatomic, copy) NSString *largeTag;


//| ----------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *colorGroupModelArray;
@property (nonatomic, strong) NSMutableArray *typeListModelArray;
@property (nonatomic, strong) NSMutableArray *specListModleArray;
@property (nonatomic, strong) NSMutableArray *listModelArray;




- (instancetype)initWithDictionay:(NSDictionary *)dic;

@end
