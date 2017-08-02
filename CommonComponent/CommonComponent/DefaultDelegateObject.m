//
//  DefaultDelegateObject.m
//  NewDescription
//
//  Created by DangDang on 2017/8/2.
//  Copyright © 2017年 DangDang. All rights reserved.
//

#import "DefaultDelegateObject.h"
#import "DefaultTableCell.h"
#import "DefaultModel.h"

@interface DefaultDelegateObject ()

@property (nonatomic, strong) NSMutableArray *itemsArrayML;

@end

@implementation DefaultDelegateObject

- (instancetype)initWithTable:(UITableView *)table
{
    self = [super init];
    
    if (self)
    {
        table.delegate = self;
        
        table.allowsSelection = NO;
        
        [table registerClass:[DefaultTableCell class] forCellReuseIdentifier:[DefaultDelegateObject description]];
    }
    
    return self;
}

- (NSMutableArray *)itemsArrayML
{
    if (![_itemsArrayML isKindOfClass:[NSArray class]])
    {
        _itemsArrayML = [NSMutableArray arrayWithCapacity:10];
    }
    
    return _itemsArrayML;
}

#pragma mark - TableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArrayML.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DefaultTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[DefaultTableCell description] forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.itemsArrayML.count) return 0;
    
    DefaultModel *model = [self.itemsArrayML objectAtIndex:indexPath.row];
    
    return model.cellHeight;
}

@end
