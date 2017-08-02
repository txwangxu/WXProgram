//
//  DefaultDelegateObject.h
//  NewDescription
//
//  Created by DangDang on 2017/8/2.
//  Copyright © 2017年 DangDang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultDelegateObject : NSObject<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithTable:(UITableView *)table;

@end
