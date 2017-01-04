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

@interface NQ_BHZ_SCCX_Inner_Controller ()
@property(nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) NQ_BHZ_SCCX_Controller *Vc;

@end
@implementation NQ_BHZ_SCCX_Inner_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    //筛选刷新
//        NSLog(@"%@==没有改变的值",[UserDefaultsSetting shareSetting].timeName);
        [[UserDefaultsSetting shareSetting] addObserver:self forKeyPath:@"timeName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - 监听时间按钮的变化
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
// 这里的代码会在主线程执行
    FuncLog;
//    dispatch_sync(dispatch_get_main_queue(), ^(){
//        
        [self loaddData];
}
-(void)setUI {
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 85;
    self.tableView.frame = CGRectMake(0, 100, Screen_w, Screen_h - 105);
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loaddData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)loaddData {
    ProduQueryModel *model = [[ProduQueryModel alloc] init];
    __weak typeof(self)  weakSelf = self;
    [model produQueryBlock:^(NSArray *result) {
        weakSelf.datas = result;
        
        [weakSelf.tableView reloadData];
        
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
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

-(void)dealloc {
    [[UserDefaultsSetting shareSetting] removeObserver:self forKeyPath:@"timeName" ];
}

@end
