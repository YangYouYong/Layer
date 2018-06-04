//
//  DataDrivedView.h
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataDrivedView <NSObject>

-(void)setObject:(id)obj;

@optional
-(void)reloadView;

@end
