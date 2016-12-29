//
//  EXPMiddleModel.m
//  toone
//
//  Created by shtoone on 16/12/26.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "EXPMiddleModel.h"
#import "MyViewController.h"
#import "YYModel.h"
#import "NetworkTool.h"

@implementation EXPMiddleModel

-(void)exMiddleBlock:(ExMiddleBlock_t)exMiddleBlock {
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:2];
    
    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
    
    //    __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        //        数据展示
        if (dict[@"success"]) {
            
            NSArray *dictArr = dict[@"data"];
            NSArray *arry = [NSArray yy_modelArrayWithClass:[EXPMiddleModel class] json:dictArr];
            
            _arry = [NSMutableArray arrayWithArray:arry];
            if (exMiddleBlock) {
                exMiddleBlock(_arry);
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
