//
//  EXPTotalModel.m
//  toone
//
//  Created by shtoone on 16/12/26.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "EXPTotalModel.h"
#import "MyViewController.h"
#import "YYModel.h"
#import "NetworkTool.h"

@implementation EXPTotalModel

-(void)exTotalBlock:(ExTotalBlock_t)exTotalBlock {
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:0];
    
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
    
    //    __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        //        数据展示
        if ([dict[@"success"] boolValue]) {
            
            NSArray *dictArr = dict[@"data"];
            NSArray *arry = [NSArray yy_modelArrayWithClass:[EXPTotalModel class] json:dictArr];
            
            _arry = [NSMutableArray arrayWithArray:arry];
            if (exTotalBlock) {
                exTotalBlock(_arry);
            }
            
        }
    }];
    
}

-(NSMutableArray *)arry {
    if (_arry == nil) {
        _arry = [NSMutableArray array];
    }
    return _arry;
}

@end
