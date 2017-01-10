//
//  TotalTableController.m
//  toone
//
//  Created by shtoone on 16/12/23.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "TotalTableController.h"
#import "EXPrimaryCell.h"
#import "NetworkTool.h"
#import "disposal_C_Model.h"
#import "EXPrimaryModel.h"
#import "DCZ_CJ_Ineer_Controller.h"

@interface TotalTableController ()
@property(nonatomic, strong) NSMutableArray *dataAr;
@property (nonatomic, strong) disposal_C_Model *disModel;
@property (nonatomic, strong) EXPrimaryModel *dataModel;
@property (nonatomic, copy) NSString *urlString;

@end
@implementation TotalTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    //    初始化加载
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:super.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:super.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].departId;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:0];
    NSString *chuzhileixing = @"";
    NSString *shebStr = @"";
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,chuzhileixing,shebStr,userGroupId,startTimeStamp,endTimeStamp];
    
    [self reloadData:urlString];
}
-(void)setUI {
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.rowHeight = 165;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.y = 100;
    self.tableView.height =  Screen_h-100;
    
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
    self.urlString = urlString;
    __weak typeof(self)  weakSelf = self;
    
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        if ([dict[@"success"] boolValue]) {
            weakSelf.disModel = [disposal_C_Model modelWithDict:dict[@"Fields"]];
            
            for (NSDictionary * dic in dict[@"data"]) {
                weakSelf.dataModel = [EXPrimaryModel modelWithDict:dic];
                [weakSelf.dataAr addObject:weakSelf.dataModel];
            }
        }
        [self.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
    }
     ];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataAr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"EXPrimaryCell";
    UINib *nib = [UINib nibWithNibName:@"EXPrimaryCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    EXPrimaryCell *cell = (EXPrimaryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.EXPModel = _dataAr[indexPath.row];
    cell.disModel = self.disModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DCZ_CJ_Ineer_Controller *dczVc = [[DCZ_CJ_Ineer_Controller alloc] init];
    [self.navigationController pushViewController:dczVc animated:YES];
}

-(NSMutableArray *)dataAr {
    if (!_dataAr) {
        _dataAr = [NSMutableArray array];
    }
    return _dataAr;
}

@end
