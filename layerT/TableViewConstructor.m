//
//  TableViewConstructor.m
//  layerT
//
//  Created by yangyouyong on 2018/4/17.
//  Copyright © 2018年 yangyouyong. All rights reserved.
//

#import "TableViewConstructor.h"
#import <UIKit/UIKit.h>
#import "ConstructorCell.h"
#import "CellStyleA.h"

#import "NetworkApi.h"

@interface TableViewConstructor()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation TableViewConstructor

-(void)construct
{
    [[self.delegate constructedTableView] reloadData];
    
    // show loading
    [NetworkApi request:@"123"
                  parms:nil
                success:^(id result) {
                    
                    // dismiss loading
                    [self constructDatasource:result];
                    [[self.delegate constructedTableView] reloadData];
                } failure:^(NSString *error) {
                    // toast out side
                    NSLog(@"%@",error);
                }];
}

// for different cell just construct different viewmodel
-(void)constructDatasource:(id)result
{
    NSMutableArray *arr = @[].mutableCopy;
    
    for (NSInteger i = 0; i < 10; i ++) {
        TableViewCellViewModel *model = [TableViewCellViewModel new];
        model.name = [NSString stringWithFormat:@"%ld",i];
        
        if (i%2 == 0) {
            TableViewCellViewModelA *m = [TableViewCellViewModelA new];
            m.subName = [NSString stringWithFormat:@"%ld",i];
            [arr addObject:m];
        }else{
            [arr addObject:model];
        }
        
    }
    self.dataArray = arr;
}

#pragma mark - TableViewDelegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TableViewCellViewModel> model = self.dataArray[indexPath.row];
    Class cellClass = model.cellClass;
    ConstructorCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellClass)];
    }
    [cell setObject:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TableViewCellViewModel> model = self.dataArray[indexPath.row];
    return [model.class heightForViewModel:model];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TableViewCellViewModel> model = self.dataArray[indexPath.row];
    if (self.cellTarget && [self.cellTarget respondsToSelector:@selector(cellTapped:)]) {
        [self.cellTarget cellTapped:model];
    }
}


@end
