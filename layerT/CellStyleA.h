//
//  CellStyleA.h
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "ConstructorCell.h"

@interface CellStyleA : ConstructorCell

@property (nonatomic, strong) UILabel *subNameLabel;

@end

@interface TableViewCellViewModelA : NSObject<TableViewCellViewModel>

@property (nonatomic, copy) NSString *subName;

@end
