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
@property(nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NQ_BHZ_SCCX_Controller *Vc;

@end
@implementation NQ_BHZ_SCCX_Inner_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    
    //筛选刷新
//    dispatch_queue_t queue = dispatch_queue_create("s", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{

        NSLog(@"%@==没有改变的值",[UserDefaultsSetting shareSetting].timeName);
        [[UserDefaultsSetting shareSetting] addObserver:self forKeyPath:@"timeName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//        开启循环
//        [[NSRunLoop currentRunLoop] run];
//    });
}

#pragma mark - 监听时间按钮的变化
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    // 这里的代码会在主线程执行
    FuncLog;
//    dispatch_sync(dispatch_get_main_queue(), ^(){
//        
        [self loaddData];
//        NSLog(@"改变的值==%@",[UserDefaultsSetting shareSetting].timeName);
//    });
}


-(void)setUI {
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 85;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    self.tableView.bounces = NO;
    
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loaddData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)loaddData {
    ProduQueryModel *model = [[ProduQueryModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model produQueryBlock:^(NSArray *result) {
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

    static NSString *CellIdentifier = @"NQ_BHZ_SCCX_Inner_Cell";
    UINib *nib = [UINib nibWithNibName:@"NQ_BHZ_SCCX_Inner_Cell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
     NQ_BHZ_SCCX_Inner_Cell *cell = (NQ_BHZ_SCCX_Inner_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    ProduQueryModel *model = _dataArr[indexPath.row];
    
    cell.ProduQueryModel = model;
    
//    cell.contentView.backgroundColor = indexPath.row%2==0 ? [UIColor colorWithRed:225.0/255 green:244.0/255 blue:241.0/255 alpha:1]: [UIColor colorWithRed:225.0/255 green:244.0/255 blue:241.0/255 alpha:1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[[NQ_BHZ_SCCX_Innel_Controller alloc] init] animated:YES];
}

-(NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

-(void)dealloc {
    [[UserDefaultsSetting shareSetting] removeObserver:self forKeyPath:@"timeName" ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
