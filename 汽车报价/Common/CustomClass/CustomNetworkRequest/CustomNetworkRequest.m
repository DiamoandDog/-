//
//  CustomNetworkRequest.m
//  汽车报价
//
//  Created by Fred on 15/9/26.


//  Copyright © 2015年 陈建军. All rights reserved.
//

#import "CustomNetworkRequest.h"

@implementation CustomNetworkRequest



+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)urlString
                                    params:(NSMutableDictionary *)params
                             requestHeader:(NSDictionary *)header
                                httpMethod:(NSString *)httpMethod
                                     block:(CompleteNetworkRequest)block

{
    
    urlString = [KBaseURL stringByAppendingString:urlString];
    //| ----------------------------------------------------------------------------------
    // Create NSMutableURLRequest objcet and Configuration request
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    [request setTimeoutInterval:30.0f];
    
    for (NSString *key in header.allKeys) {
        [request addValue:header[key] forHTTPHeaderField:key];
    }
    
    
    //|-----------------------------------------------------------------------------------
    //!The Reqeust HTTPMethod @"GET"
    NSComparisonResult comparisonResutGet = [httpMethod caseInsensitiveCompare:@"GET"];
    
    if (comparisonResutGet == NSOrderedSame) {
        
        [request setHTTPMethod:@"GET"];
        
        if (params != nil)
        {
            
            NSMutableString *paramsString = [NSMutableString string];
            
            for (NSString *key in params.allKeys)
            {
                
                [paramsString appendFormat:@"&%@=%@",key, params[key]];
                
            }
            
            if (paramsString.length > 0)
            {
                [paramsString replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
                
                // Refresh URL for adding parameters to url
                [request setURL:[NSURL URLWithString:[urlString stringByAppendingString:paramsString]]];
                
            }
        }
    }
    
    //|-----------------------------------------------------------------------------------
    //!The Request HTTPMethod @"Post"
    NSComparisonResult comparisonResutPost = [httpMethod caseInsensitiveCompare:@"POST"];
    if (comparisonResutPost == NSOrderedSame) {
        
        [request setHTTPMethod:@"POST"];
        
        for (NSString *key in params) {
            
            [request setHTTPBody:params[key]];
        }
        
    }

    //|-----------------------------------------------------------------------------------
    //!Sending aychronously the Network Request by encapsulated  object from AFNetworking
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    


    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];

    
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id  responseObject) {
        if (block != nil) {
            block(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * operation, NSError *  error) {
        //NSLog(@"CustomNetWorkReqeust-98->Error:%@",[error localizedDescription]);
        if (block != nil) {
            block(error);
        }
    }];
    
    [requestOperation start];
    
    return requestOperation;
}


+ (NSMutableURLRequest *)requestWithURL:(NSString *)urlString
                                 params:(NSMutableDictionary *)params
                             httpMethod:(NSString *)httpMethod
                          requestHeader:(NSDictionary *)header
                                  block:(CompleteNetworkRequest)block

{
    urlString = [KBaseURL stringByAppendingString:urlString];

    //|-----------------------------------------------------------------------------------
    //!Create NSMutableURLRequest object and configuration

    NSMutableURLRequest *requeset = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [requeset setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    [requeset setTimeoutInterval:30.0];
    
    for (NSString *key in header.allKeys) {
        
        [requeset addValue:header[key] forHTTPHeaderField:key];
        
    }
    
    //|-----------------------------------------------------------------------------------
    //!The request HTTPMethod @"GET"
    NSComparisonResult compareGET = [httpMethod caseInsensitiveCompare:@"GET"];
    if (compareGET == NSOrderedSame)
    {
        
        [requeset setHTTPMethod:@"GET"];
        
        NSMutableString *paramString = [NSMutableString string];
        
        for (NSString *key in params.allKeys)
        {
            
            [paramString appendFormat:@"&%@=%@",key,params[key]];
            
            if (paramString.length > 0)
            {
                
                [paramString replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
                
                // Refresh URL for adding parameters to url
                [requeset setURL:[NSURL URLWithString:[urlString stringByAppendingString:paramString]]];
                
            }
            
        }
        
    }
    
    //|-----------------------------------------------------------------------------------
    //!The request HTTPMethod @"POST"
    NSComparisonResult comparePOST = [httpMethod caseInsensitiveCompare:@"POST"];
    if (comparePOST == NSOrderedSame)
    {
        
        [requeset setHTTPMethod:@"POST"];
        
        for (NSString *key in params.allKeys)
        {
            [requeset setHTTPBody:params[key]];
            
        }
        
    }
    
    //|-----------------------------------------------------------------------------------
    //!Sending acychronously network reqeust by NSURLConnection objcet
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:requeset queue:queue completionHandler:^(NSURLResponse * response, NSData *  data, NSError *  connectionError) {
        
        if (connectionError)
        {
            
            NSLog(@"CustomNetWorkReqeust-167->error:%@",connectionError);
            
            if (block != nil)
            {
                
                block(connectionError);
            }
        }
        else
        {
            if (block != nil) {
                
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
                
                block(result);
            }
        }
    }];
    return requeset;

    
}
    
    
    

@end
