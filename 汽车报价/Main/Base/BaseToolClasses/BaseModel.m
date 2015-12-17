//
//  BaseModel.m
//  汽车报价
//
//  Created by Fred on 15/9/24.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


- (instancetype)initModelDataWithJsonDic:(NSDictionary *)jsonDic
{
    self = [super init];
    if (self) {
        
        // The properties maps with the key of JsonDic
        [self _setAttributes:jsonDic];
    }
    return self;
}


#pragma mark -
#pragma mark
//|-----------------------------------------------------------------------------------
//!属性名与json字典的key 的映射关系
//key:  json字典的key名
//value: model对象的属性名
- (NSDictionary *)modelAttributesMapJsonDictionaryKey
{
    return nil;
}



#pragma mark -
#pragma mark Private methods - GET Selector from String
//| ---------------------------------------------------------------------------------------------
//***********************************************************************************************
- (SEL)_getSetterSelectorWithModelAttributeName:(NSString *)attributeName
{
    
    
    NSString *captitalLetter = [[attributeName substringToIndex:1] uppercaseString];
    
    NSString *setterSelectorString = [NSString stringWithFormat:@"set%@%@:",captitalLetter,[attributeName substringFromIndex:1]];
    
    return NSSelectorFromString(setterSelectorString);
}




#pragma mark -
#pragma mark
//| ----------------------------------------------------------------------------------
//! Attributes and JsonDic map for key
//  key : jsonDic(key) value model properties name
-(void)_setAttributes:(NSDictionary *)jsonDic
{
    NSDictionary *modelAttributeDic = [self modelAttributesMapJsonDictionaryKey];
    
    if (modelAttributeDic == nil) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:jsonDic.count];
        
        //????????😖😖😖😖😖😖😖😖😖😖???????? for (NSString *key in jsonDic) Why

        for (NSString *key in jsonDic.allKeys) {
            
            [dic setValue:key forKey:key];
            
            modelAttributeDic = dic;
        }
    }
    

    
    NSEnumerator *keyEnum = [modelAttributeDic keyEnumerator];
    
    id modelAttributeName;

    while (modelAttributeName = [keyEnum nextObject]) {
        
        SEL selector = [self _getSetterSelectorWithModelAttributeName:modelAttributeName];
        
        if ([self respondsToSelector:selector]) {
            
            NSString *jsonDicKey = [modelAttributeDic objectForKey:modelAttributeName];
            
            id modelAttributeValue = [jsonDic objectForKey:jsonDicKey];
            
            [self performSelectorOnMainThread:selector
                                   withObject:modelAttributeValue
                                waitUntilDone:YES]; // reports whether current thread is main
            
        }
    }
}





@end
























