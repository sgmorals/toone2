//
//  DayQueryTableViewController.m
//  toone
//
//  Created by shtoone on 16/12/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "DayQueryTableViewController.h"
#import "DayQueryModel.h"
#import "DayQueryTableViewCell.h"
#import "DayDetailsController.h"

@interface DayQueryTableViewController ()
@property(nonatomic, strong) NSArray *dataArr;
@end
@implementation DayQueryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUI];
    [self loadData];
}

-(void)setUI {
    self.tableView.rowHeight = 180;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)loadData {
    DayQueryModel *model = [[DayQueryModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model dayQueryBlock:^(NSArray *result) {
        weakSelf.dataArr = result;
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DayQueryTableViewCell";
    UINib *nib = [UINib nibWithNibName:@"DayQueryTableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    DayQueryTableViewCell *cell = (DayQueryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    DayQueryModel *model = _dataArr[indexPath.row];
    //产量存值
    [UserDefaultsSetting shareSetting].dailyid = model.dailyid;
    [UserDefaultsSetting shareSetting].dailysbbh = model.dailysbbh;
    
    cell.dayQueryModel = model;
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DayDetailsController *detailVc = [[DayDetailsController alloc] init];
    detailVc.model = _dataArr[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end
