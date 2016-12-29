//
//  LQ_BHZ_SB_Controller.m
//  toone
//
//  Created by shtoone on 16/12/28.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "LQ_BHZ_SB_Controller.h"

@interface LQ_BHZ_SB_Controller ()


@end
@implementation LQ_BHZ_SB_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}

-(void)setUI {
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"设备列表";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 85;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    self.tableView.bounces = NO;
    
//    self.tableView.mj_header = [MJDIYHeader2 headerWithRefreshingTarget:self refreshingAction:@selector(loaddData)];
//    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
