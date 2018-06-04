//
//  ViewController.m
//  layerT
//
//  Created by yangyouyong on 2018/4/8.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "ViewController.h"
#import "TableViewConstructor.h"

@interface ViewController ()<
TableViewConstructor,
CellTarget>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewConstructor *constructor;

@end

@implementation ViewController

- (TableViewConstructor *)constructor
{
    if (!_constructor) {
        _constructor = [TableViewConstructor new];
        _constructor.delegate = self;
        _constructor.cellTarget = self;
    }
    return _constructor;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self.constructor;
        _tableView.dataSource = self.constructor;
        _tableView.frame = [UIScreen mainScreen].bounds;
    }
    return _tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.constructor.delegate = self;
    [self.constructor construct];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UITableView *)constructedTableView
{
    return self.tableView;
}

// need optimized JLRouter or custom protocol
- (void)cellTapped:(TableViewCellViewModel *)model
{
    NSLog(@"goto name:%@",model.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
