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
#import "NetworkTool.h"

@interface DayQueryTableViewController ()
@property(nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) DayQueryModel *dataModel;
@property (nonatomic, copy) NSString *urlString;


@end
@implementation DayQueryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].departId;
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:super.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:super.endTime];
    NSString *shebStr = @"";
    NSString *urlString = [NSString stringWithFormat:DayQuery,userGroupId,shebStr,startTimeStamp,endTimeStamp];

    [self reloadData:urlString];
}

-(void)setUI {
    self.tableView.rowHeight = 180;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    
    //添加刷新(初始化URL）
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingBlock:^{
        [weakSelf  reloadData:weakSelf.urlString];
    }];
    //    添加加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf reloadData:weakSelf.urlString];
    }];
}

-(void)reloadData:(NSString *)urlString {
    __weak typeof(self)  weakSelf = self;
    weakSelf.urlString = urlString;
    
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        if ([dict[@"success"] boolValue]) {
            for (NSDictionary * dic in dict[@"data"]) {
                weakSelf.dataModel = [DayQueryModel modelWithDict:dic];
                [weakSelf.dataArr addObject:weakSelf.dataModel];
            }
            }else {
            
            }
        [self.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
    }
     ];
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

-(NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
