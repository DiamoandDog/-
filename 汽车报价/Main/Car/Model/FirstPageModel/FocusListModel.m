//
//  FocusListModel.m
//  汽车报价
//
//  Created by Fred on 15/9/27.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "FocusListModel.h"

@implementation FocusListModel


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
// key :model's properties value :json's key
- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{
    NSDictionary *attributesMapDic = @{
                                       @"foucusImageURL":@"focusimageurl",
                                       @"foucusNewsURL":@"focusnewsurl"
                                       };
    return attributesMapDic;
}


//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
//Custom initialization methods for model
- (instancetype)initWithJsonDataDictionary:(NSDictionary *)JsonDic
{
    self = [super init];
    if (self) {
        
        self.foucusImageURL = JsonDic[@"focusimageurl"];
        self.foucusNewsURL = JsonDic[@"focusnewsurl"];
        
    }
    return self;
}



@end
