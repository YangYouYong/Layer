//
//  NetworkApi.h
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkApi : NSObject

+(void)request:(NSString *)path
         parms:(id)parms
       success:(void(^)(id result))successBlock
       failure:(void(^)(NSString *error))failureBlock;

@end
