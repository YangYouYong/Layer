//
//  ConstructorCell.m
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "ConstructorCell.h"

@interface ConstructorCell()

@end

@implementation ConstructorCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    self.nameLabel = [UILabel new];
    [self.contentView addSubview:self.nameLabel];
    self.nameLabel.frame = CGRectMake(20, 20, 100, 40);
    self.nameLabel.textColor = [UIColor brownColor];
}

-(void)setObject:(id)obj
{
    if ([obj isKindOfClass:[TableViewCellViewModel class]]) {
        TableViewCellViewModel *model = (TableViewCellViewModel *)obj;
        self.nameLabel.text = model.name;
    }
}

@end

@implementation TableViewCellViewModel

+(CGFloat)heightForViewModel:(TableViewCellViewModel *)model
{
    return 50;
}

-(Class)cellClass
{
    return [ConstructorCell class];
}

@end
