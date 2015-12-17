//
//  CustomNetworkRequest.h
//  汽车报价
//
//  Created by Fred on 15/9/26.
//  Copyright © 2015年 陈建军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define KBaseURL @"http://baojia.qichecdn.com/priceapi3.9.9/services/"

typedef void (^CompleteNetworkRequest)(id result);


@interface CustomNetworkRequest : NSObject



// Using AFNetWorking Framework for network request
// Support JOSN and XML Data asychro
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)urlString
                                    params:(NSMutableDictionary *)params
                             requestHeader:(NSDictionary *)header
                                httpMethod:(NSString *)httpMethod
                                     block:(CompleteNetworkRequest)block;


// Using system Framework for network request
// Only support JSON data
+ (NSMutableURLRequest *)requestWithURL:(NSString *)urlString
                                 params:(NSMutableDictionary *)params
                             httpMethod:(NSString *)httpMethod
                          requestHeader:(NSDictionary *)header
                                  block:(CompleteNetworkRequest)block;




@end
