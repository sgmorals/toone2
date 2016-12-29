//
//  EXPrimaryCell.m
//  toone
//
//  Created by shtoone on 16/12/23.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "EXPrimaryCell.h"
#import "EXPrimaryModel.h"
#import "MyViewController.h"
#import "NetworkTool.h"
#import "YYModel.h"

@interface EXPrimaryCell ()
//字段名称
@property (weak, nonatomic) IBOutlet UILabel *sjf1Label;
@property (weak, nonatomic) IBOutlet UILabel *sjf2Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg1Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg2Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg3Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg4Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg5Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg6Label;
@property (weak, nonatomic) IBOutlet UILabel *sjg7Label;
@property (weak, nonatomic) IBOutlet UILabel *sjlqLabel;
@property (weak, nonatomic) IBOutlet UILabel *sjtjjLabel;
@property (weak, nonatomic) IBOutlet UILabel *sjysbLabel;
//数据显示
@property (weak, nonatomic) IBOutlet UILabel *wsjf1Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjf2Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg1Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg2Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg3Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg4Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg5Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg6Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjg7Label;
@property (weak, nonatomic) IBOutlet UILabel *wsjlqLabel;
@property (weak, nonatomic) IBOutlet UILabel *wsjtjjLabel;
@property (weak, nonatomic) IBOutlet UILabel *wsjysbLabel;

@property (weak, nonatomic) IBOutlet UILabel *shijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *bianhaoLabel;
//设备编号
@property (weak, nonatomic) IBOutlet UILabel *shebeibianhaoLabel;

@property (weak, nonatomic) IBOutlet UIView *conView;

@end
@implementation EXPrimaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setEXPModel:(EXPrimaryModel *)EXPModel {
    _EXPModel = EXPModel;
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:1];
    
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
             NSDictionary *dict = (NSDictionary *)result;
        if (dict[@"success"]) {
            EXPrimaryModel *dictModel = [EXPrimaryModel yy_modelWithDictionary:dict[@"Fields"]];
            
            self.sjf1Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjf1];
            self.sjf2Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjf2];
            self.sjg1Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg1];
            self.sjg2Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg2];
            self.sjg3Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg3];
            self.sjg4Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg4];
            self.sjg5Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg5];
            self.sjg6Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg6];
            self.sjg7Label.text = [NSString stringWithFormat:@"%@:",dictModel.sjg7];
            
            self.sjlqLabel.text = [NSString stringWithFormat:@"%@:",dictModel.sjlq];
            self.sjtjjLabel.text = [NSString stringWithFormat:@"%@:",dictModel.sjtjj];
            self.sjysbLabel.text = [NSString stringWithFormat:@"%@:",dictModel.sjysb];
        }
        
    }];
    
    
//    数据显示
    self.wsjf1Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjf1];
    self.wsjf2Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjf2];
    self.wsjg1Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg1];
    self.wsjg2Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg2];
    self.wsjg3Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg3];
    self.wsjg4Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg4];
    self.wsjg5Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg5];
    self.wsjg6Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg6];
    self.wsjg7Label.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjg7];
    
    self.wsjlqLabel.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjlq];
    self.wsjtjjLabel.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjtjj];
    self.wsjysbLabel.text = [NSString stringWithFormat:@"%@%%",EXPModel.wsjysb];
    
    self.shijianLabel.text = [NSString stringWithFormat:@"%@%%",EXPModel.shijian];
    self.bianhaoLabel.text = [NSString stringWithFormat:@"%@", EXPModel.bianhao];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
