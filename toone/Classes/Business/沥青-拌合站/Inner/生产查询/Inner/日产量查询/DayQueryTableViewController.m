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

@interface DayQueryTableViewController ()
@property(nonatomic, strong) NSArray *dataArr;

@end
@implementation DayQueryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUi];
    [self setData];
}

-(void)setUi {
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 180;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    self.tableView.bounces = NO;
}

-(void)setData {
    DayQueryModel *model = [[DayQueryModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model dayQueryBlock:^(NSArray *result) {
        weakSelf.dataArr = result;
        
        [weakSelf.tableView reloadData];
        
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
    
    cell.dayQueryModel = model;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (indexPath.row%2==0) {
//        
//        cell.backgroundColor = [UIColor colorWithRed:225.0/255 green:244.0/255 blue:241.0/255 alpha:1];
//        
//    }else {
//        
//        cell.backgroundColor = [UIColor colorWithRed:232.0/255 green:232.0/255 blue:253.0/255 alpha:1];
//        
//    }
//}


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
