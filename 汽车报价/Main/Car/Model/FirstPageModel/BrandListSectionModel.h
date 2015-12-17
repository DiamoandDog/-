//
//  BrandListSectionModel.h
//  汽车报价
//
//  Created by Fred on 15/9/29.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandListSectionModel : NSObject

@property (nonatomic, copy) NSString *sectionHeaderLetter;
@property (nonatomic, strong) NSMutableArray *sectionBrandListArray;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
