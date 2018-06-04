//
//  ConstructorCell.h
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"
#import "DataDrivedView.h"

@protocol TableViewCellViewModel<NSObject>

+(CGFloat)heightForViewModel:(id<TableViewCellViewModel>)model;
-(Class)cellClass;

@end

@protocol CellTarget<NSObject>

@optional
-(void)cellTapped:(id<TableViewCellViewModel> )model;

@end

@interface ConstructorCell : UITableViewCell<DataDrivedView>

@property (nonatomic, strong) UILabel *nameLabel;

@end

@interface TableViewCellViewModel : BaseViewModel<TableViewCellViewModel>

@property (nonatomic, copy) NSString *name;

@end
