//
//  EXPSeniorModel.m
//  toone
//
//  Created by shtoone on 16/12/26.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "EXPSeniorModel.h"
#import "MyViewController.h"
#import "YYModel.h"
#import "NetworkTool.h"

@implementation EXPSeniorModel

-(void)exSeniorBlock:(ExSeniorBlock_t)exSeniorBlock {
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:3];
    
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
    
    //    __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        //        数据展示
        if (dict[@"success"]) {
            
            NSArray *dictArr = dict[@"data"];
            NSArray *arry = [NSArray yy_modelArrayWithClass:[EXPSeniorModel class] json:dictArr];
            
            _arry = [NSMutableArray arrayWithArray:arry];
            if (exSeniorBlock) {
                exSeniorBlock(_arry);
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
