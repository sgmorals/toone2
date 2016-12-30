//
//  LQViewController.m
//  toone
//
//  Created by shtoone on 16/12/17.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "LQViewController.h"
#import "LQ_BHZ_ZJM_Cell.h"
#import "Lq_ZJM_Cell.h"
#import "LQModel.h"
#import "ManageViewController.h"
#import "LqNodeViewController.h"

@interface LQViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet BBFlashCtntLabel *flashLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *senchBut;
@property (weak, nonatomic) IBOutlet UIView *ContreView;

//@property (nonatomic, strong) LQModel *LqMoodel;

@property (nonatomic,strong) NSArray * dataArr;

@end
@implementation LQViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString * zjjg = FormatString(@"组织机构 : ", [UserDefaultsSetting shareSetting].LqDepartName);
    self.flashLabel.text = FormatString(zjjg, @"\t\t\t\t\t\t\t\t\t\t");
    self.flashLabel.textColor = [UIColor whiteColor];
    self.flashLabel.font = [UIFont systemFontOfSize:12.0];
    self.flashLabel.speed = BBFlashCtntSpeedSlow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setData];
    [self setRightBut];
}


#pragma mark - 组织机构
-(void) setRightBut {
    UIButton * btn = [UIButton img_20WithName:@"ic_format_list_numbered_white_24dp"];
    [btn addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void) searchButtonClick:(id)sender {
    [self.navigationController pushViewController:[[LqNodeViewController alloc] init] animated:YES];
    NSNumber *number = [NSNumber numberWithInt:2];
    [UserDefaultsSetting shareSetting].funtype = number;
}

#pragma mark - 查询
- (IBAction)senchClick:(UIButton *)sender {
    sender.enabled = NO;
    //1.
    UIButton * backView = [UIButton buttonWithType:UIButtonTypeSystem];
    backView.frame = CGRectMake(0, 64+35, Screen_w, Screen_h - 49 -64-35);
    backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    backView.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 150ull*NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        backView.hidden = NO;
    });
    [self.view addSubview:backView];
    
    //2.
    Exp1View * e = [[Exp1View alloc] init];
    e.frame = CGRectMake(0, 64+35, Screen_w, 150);
    __weak __typeof(self)  weakSelf = self;
    e.expBlock = ^(ExpButtonType type,id obj1,id obj2){
        //        NSLog(@"%d",type);
        if (type == ExpButtonTypeCancel) {
            sender.enabled = YES;
            [backView removeFromSuperview];
        }
        if (type == ExpButtonTypeOk) {
            sender.enabled = YES;
            [backView removeFromSuperview];
            //
            weakSelf.startTime = (NSString*)obj1;
            weakSelf.endTime = (NSString*)obj2;
            [weakSelf setData];
            //            FuncLog;
        }
        if (type == ExpButtonTypeStartTimeButton || type == ExpButtonTypeEndTimeButton) {
            UIButton * btn = (UIButton*)obj1;
            [weakSelf calendarWithTimeString:btn.currentTitle obj:btn];
        }
    };
    [self.view addSubview:e];
}


#pragma mark - 一次性设置
-(void)setUI {
    self.ContreView.backgroundColor = BLUECOLOR;
//    self.tableView.backgroundColor = [UIColor oldLaceColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    self.tableView.rowHeight = 130;
    self.view.backgroundColor = [UIColor oldLaceColor];
    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(setData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)setData {
    LQModel *model = [[LQModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model mainModelBlock:^(NSArray *result) {
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
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"LQ_BHZ_ZJM_Cell";
        UINib *nib = [UINib nibWithNibName:@"LQ_BHZ_ZJM_Cell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        LQ_BHZ_ZJM_Cell *cell = (LQ_BHZ_ZJM_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        LQModel * model = self.dataArr[indexPath.row];
        cell.LqMoodel = model;

         cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        return cell;
    }else {
        
        static NSString *CellIdentifier = @"Lq_ZJM_Cell";
        UINib *nib = [UINib nibWithNibName:@"Lq_ZJM_Cell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        Lq_ZJM_Cell *cell = (Lq_ZJM_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        LQModel * model = self.dataArr[indexPath.row];
        cell.model = model;
        
        //取消选中cell背景颜色
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 50;
    }else{
        
        return 25;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ManageViewController *manageVc = [[ManageViewController alloc] init];
    [self.navigationController pushViewController:manageVc animated:YES];
    self.navigationController.hidesBottomBarWhenPushed = YES;
    
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


-(NSArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
