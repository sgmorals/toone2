//
//  ProduQueryTableViewController.m
//  toone
//
//  Created by shtoone on 16/12/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "NQ_BHZ_SCCX_Inner_Controller.h"
#import "ProduQueryModel.h"
#import "NQ_BHZ_SCCX_Inner_Cell.h"
#import "NQ_BHZ_SCCX_Innel_Controller.h"
#import "NQ_BHZ_SCCX_Controller.h"
#import "NetworkTool.h"

@interface NQ_BHZ_SCCX_Inner_Controller ()
@property(nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) NQ_BHZ_SCCX_Controller *Vc;
@property (nonatomic, strong) ProduQueryModel *dataModel;

@property (nonatomic, copy) NSString *urlString;
@end
@implementation NQ_BHZ_SCCX_Inner_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
     //    __weak typeof(self)  weakSelf = self;
    NSString * userGroupId = [UserDefaultsSetting shareSetting].departId;
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:super.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:super.endTime];
    NSString *shebStr = @"";
    NSString *urlString = [NSString stringWithFormat:ProduQuery,userGroupId,shebStr,startTimeStamp,endTimeStamp];
    [self reloadData:urlString];
}

-(void)setUI {
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 85;
    self.tableView.frame = CGRectMake(0, 100, Screen_w, Screen_h - 105);
    
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
                weakSelf.dataModel = [ProduQueryModel modelWithDict:dic];
                [weakSelf.datas addObject:weakSelf.dataModel];
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
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"NQ_BHZ_SCCX_Inner_Cell";
    UINib *nib = [UINib nibWithNibName:@"NQ_BHZ_SCCX_Inner_Cell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
     NQ_BHZ_SCCX_Inner_Cell *cell = (NQ_BHZ_SCCX_Inner_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    ProduQueryModel *model = self.datas[indexPath.row];
    cell.ProduQueryModel = model;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[[NQ_BHZ_SCCX_Innel_Controller alloc] init] animated:YES];
}

-(NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
