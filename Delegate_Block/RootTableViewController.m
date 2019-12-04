//
//  RootTableViewController.m
//  Delegate_Block
//
//  Created by Sjx on 2019/12/4.
//  Copyright © 2019 sjx. All rights reserved.
//

#import "RootTableViewController.h"

static NSString * const TableviewCellID = @"TableviewCellID";

@interface RootTableViewController ()

/** 数据 */
@property(nonatomic, strong) NSArray *listArray;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupTableView];
}

- (void)setupData {
    self.title = @"代理方式";
    self.listArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TableData.plist" ofType:nil]];
    [self.tableView reloadData];
}

- (void)setupTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableviewCellID];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.listArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableviewCellID forIndexPath:indexPath];
    cell.textLabel.text = [dict objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = self.listArray[indexPath.row];
    NSString *vcName = [dict objectForKey:@"vc"];
    UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - <懒加载>
- (NSArray *)listArray {
    if (!_listArray) {
        _listArray = [NSArray array];
    }
    return _listArray;
}

@end
