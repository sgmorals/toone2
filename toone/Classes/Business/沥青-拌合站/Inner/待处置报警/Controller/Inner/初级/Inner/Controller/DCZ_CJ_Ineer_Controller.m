//
//  DCZ_CJ_Ineer_Controller.m
//  toone
//
//  Created by shtoone on 17/1/5.
//  Copyright © 2017年 shtoone. All rights reserved.
//

#import "DCZ_CJ_Ineer_Controller.h"
#import "NetworkTool.h"
#import "NQ_BHZ_SCCX_Inne_Cell.h"
#import "NQ_BHZ_SCCX_InneModel.h"
#import "NQ_BHZ_SCCX_Inne_ moreModel.h"
#import "ProductionDetailsM.h"
#import "ProductionDetailsG.h"
#import "HNT_CBCZ_Detail_HeadMsg.h"
#import "LQ_CBCZ_Detail_ChuliCell.h"

@interface DCZ_CJ_Ineer_Controller ()
@property (nonatomic, strong) ProductionDetailsM *modelM;//数据显示
@property (nonatomic, strong) NQ_BHZ_SCCX_InneModel *model;//字段名称
@property (nonatomic, strong) NQ_BHZ_SCCX_Inne__moreModel *moreModel;//数据
@property (nonatomic, strong) ProductionDetailsG *modelG;
@property (nonatomic, strong) HNT_CBCZ_Detail_HeadMsg *headMsg;//超标处置

@end
@implementation DCZ_CJ_Ineer_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self looadData];
    
     [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
}

- (void)keyboardWillChange:(NSNotification  *)notification{
    // 1.获取键盘的Y值
    NSDictionary *dict  = notification.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    //动画时间
    CGFloat duration = [dict[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    // 2.计算需要移动的距离
    [UIView animateWithDuration:duration delay:0.0 options:7 << 16 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);
    } completion:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    FuncLog;
}


-(void)setUI {
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.navigationItem.title = @"详情";
    [self looadData];
}

-(void)looadData {
    NSString *shebeiStr = @"G345lq0101";
//    NSString *shebeiStr = [UserDefaultsSetting shareSetting].CBshebeibianhao;
    NSNumber *bianhaoBer = [UserDefaultsSetting shareSetting].CBbianhao;
    NSString *urlString = [NSString stringWithFormat:LQExInner,bianhaoBer,shebeiStr];
    
    __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSMutableArray * datas = [NSMutableArray array];
        NSDictionary *dict = (NSDictionary *)result;
        
        if ([dict[@"success"] boolValue]) {
            weakSelf.modelM = [ProductionDetailsM modelWithDict:dict[@"data"]];
            weakSelf.model = [NQ_BHZ_SCCX_InneModel moodWithDict:dict[@"Fields"]];
            
            weakSelf.moreModel = [NQ_BHZ_SCCX_Inne__moreModel modelWithDict:dict[@"data"]];
            weakSelf.modelG = [ProductionDetailsG modelWithDict:dict[@"Fields"]];
            
            weakSelf.headMsg = [HNT_CBCZ_Detail_HeadMsg modelWithDict:dict[@"data"]];
            [datas addObject:weakSelf.modelM];
            [datas addObject:weakSelf.model];
        }
        [weakSelf.tableView reloadData];
    }
     ];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 630;
    }else{
        return 350;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"NQ_BHZ_SCCX_Inne_Cell";
        UINib *nib = [UINib nibWithNibName:@"NQ_BHZ_SCCX_Inne_Cell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        NQ_BHZ_SCCX_Inne_Cell *cell = (NQ_BHZ_SCCX_Inne_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        //上段
        cell.model = self.model;
        cell.modelM = self.modelM;//数据
        //核算表
        cell.moreModel = self.moreModel;//数据
        cell.modelG = self.modelG;
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        static NSString *CellIdentifier = @"LQ_CBCZ_Detail_ChuliCell";
        UINib *nib = [UINib nibWithNibName:@"LQ_CBCZ_Detail_ChuliCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        LQ_CBCZ_Detail_ChuliCell *cell = (LQ_CBCZ_Detail_ChuliCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.headMsg = self.headMsg;
        cell.weakController = self;
        cell.chuli = [UserDefaultsSetting shareSetting].chuli;
        return cell;
    }
    return nil;
}


@end
