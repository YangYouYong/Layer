//
//  NetworkApi.m
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "NetworkApi.h"

@implementation NetworkApi

+(void)request:(NSString *)path
         parms:(id)parms
       success:(void(^)(id result))successBlock
       failure:(void(^)(NSString *error))failureBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (successBlock) {
            successBlock(@"success");
        }
    });
}

@end
