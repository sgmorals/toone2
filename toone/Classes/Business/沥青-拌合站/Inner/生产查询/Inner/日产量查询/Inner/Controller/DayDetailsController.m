//
//  DayDetailsController.m
//  toone
//
//  Created by shtoone on 17/1/3.
//  Copyright © 2017年 shtoone. All rights reserved.
//

#import "DayDetailsController.h"
#import "DayDetailsCell.h"
#import "DayQueryModel.h"
@interface DayDetailsController ()


@end
@implementation DayDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}
-(void)setUI {
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.title = @"日产量详情";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 30;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DayDetailsCell";
    UINib *nib = [UINib nibWithNibName:@"DayDetailsCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    DayDetailsCell *cell = (DayDetailsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    [cell model:self.model withIndex:indexPath.row];
    cell.weakController = self;
//    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改数值" message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 获取当前选中行
//    DayQueryModel *aaa = self.model[indexPath.row];
    // 添加文本输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // 设置默认文字
        textField.text = @"sss";
    }];
    // 创建取消按钮
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    __weak UIAlertController *weakAlertC = alertController;
    // 确定
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 取出文字输入框
        UITextField *textField = weakAlertC.textFields.firstObject;
//        hero.name = textField.text;
        [self.tableView reloadData];
    }];
    [alertController addAction:ok];
    
    // 显示
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 ||indexPath.row == 8) {
        [Tools tip:@"此数据不能修改"];
    }else {
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
