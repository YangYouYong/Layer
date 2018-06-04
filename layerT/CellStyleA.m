//
//  CellStyleA.m
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "CellStyleA.h"

@implementation CellStyleA

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    self.subNameLabel = [UILabel new];
    [self.contentView addSubview:self.subNameLabel];
    self.subNameLabel.frame = CGRectMake(20, 20, 100, 40);
    self.subNameLabel.textColor = [UIColor greenColor];
}

-(void)setObject:(id)obj
{
    if ([obj isKindOfClass:[TableViewCellViewModelA class]]) {
        TableViewCellViewModelA *model = (TableViewCellViewModelA *)obj;
        self.subNameLabel.text = model.subName;
    }
}

@end

@implementation TableViewCellViewModelA

+(CGFloat)heightForViewModel:(TableViewCellViewModelA *)model
{
    return 80;
}

-(Class)cellClass
{
    return [CellStyleA class];
}

@end
