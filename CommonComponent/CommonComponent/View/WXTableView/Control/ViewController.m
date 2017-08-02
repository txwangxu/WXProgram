//
//  ViewController.m
//  NewDescription
//
//  Created by DangDang on 2017/8/2.
//  Copyright © 2017年 DangDang. All rights reserved.
//

#import "ViewController.h"
#import "DefaultDelegateObject.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView *table;

@property (nonatomic, strong) DefaultDelegateObject *delegateObjc;

@end

@implementation ViewController

- (DefaultDelegateObject *)delegateObjc
{
    if (![_delegateObjc isKindOfClass:[DefaultDelegateObject class]])
    {
        _delegateObjc = [[DefaultDelegateObject alloc] init];
    }
    
    return _delegateObjc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.table = table;
    [self.view addSubview:table];

    DefaultDelegateObject *delegateObjc = [[DefaultDelegateObject alloc] initWithTable:table];
    self.delegateObjc = delegateObjc;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
