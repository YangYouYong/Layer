//
//  TableViewConstructor.h
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "Constructor.h"
#import "ConstructorCell.h"

@protocol TableViewConstructor<NSObject>

-(UITableView *)constructedTableView;

@end

@interface TableViewConstructor : Constructor<
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, weak) id<TableViewConstructor> delegate;
@property (nonatomic, weak) id<CellTarget> cellTarget;

@end
