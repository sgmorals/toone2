//
//  SeniorExcessiveTableConller.m
//  toone
//
//  Created by shtoone on 16/12/22.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "SeniorExcessiveTableConller.h"
#import "EXPSeniorModel.h"
#import "EXPrimaryCell.h"
#import "MyViewController.h"
#import "NetworkTool.h"
#import "disposal_C_Model.h"
#import "DCZ_CJ_Ineer_Controller.h"

@interface SeniorExcessiveTableConller ()
@property(nonatomic, strong) NSArray *dataAr;
@property (nonatomic, strong) disposal_C_Model *disModel;

@end
@implementation SeniorExcessiveTableConller

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setUI];
    [self loadData];
}

-(void)setUI {

    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 170;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView.mj_header beginRefreshing];
}


-(void)loadData {
    EXPSeniorModel *model = [[EXPSeniorModel  alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model exSeniorBlock:^(NSMutableArray *result) {
        weakSelf.dataAr = result;
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:3];
    
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
    
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        if ([dict[@"success"] boolValue]) {
            weakSelf.disModel = [disposal_C_Model modelWithDict:dict[@"Fields"]];
        }
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

@end
