//
//  Constructor.h
//  layerT
//
//  Created by yangyouyong on 2018/4/8.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Constructor<NSObject>

- (void)construct;

@end

@interface Constructor : NSObject<Constructor>

@end
