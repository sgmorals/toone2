//
//  MiddleExcessiveTableContller.m
//  toone
//
//  Created by shtoone on 16/12/22.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "MiddleExcessiveTableContller.h"
#import "EXPMiddleModel.h"
#import "EXPrimaryCell.h"

@interface MiddleExcessiveTableContller ()
@property(nonatomic, strong) NSArray *dataAr;

@end
@implementation MiddleExcessiveTableContller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self setData];
}

-(void)setUI {
//    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 170;
    self.tableView.frame = CGRectMake(0, 95, Screen_w, Screen_h - 100);
    
}

-(void)setData {
    EXPMiddleModel *model = [[EXPMiddleModel alloc] init];
    
    __weak typeof(self)  weakSelf = self;
    [model exMiddleBlock:^(NSMutableArray *result) {
        weakSelf.dataAr = result;
        
        [weakSelf.tableView reloadData];
        
    }];
    
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
    
    return cell;
}


-(NSArray *)dataAr {
    if (_dataAr == nil) {
        _dataAr = [NSArray array];
    }
    return _dataAr;
}


@end
