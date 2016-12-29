//
//  LQModel.m
//  toone
//
//  Created by shtoone on 16/12/19.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "LQModel.h"
#import "YYModel.h"
#import "NetworkTool.h"
#import "MyViewController.h"

@implementation LQModel

-(void)mainModelBlock:(MainModelBlock)mainModelBlock {
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    
    NSString *urlString = [NSString stringWithFormat:LQHome,userGroupId,startTimeStamp,endTimeStamp];
    
//    __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        if (dict[@"success"]) {
            NSArray *dictArr = dict[@"data"];
            
            NSArray *arr = dictArr[0];
           
                _arry = [NSArray yy_modelArrayWithClass:[LQModel class] json:arr];
            
            if (mainModelBlock) {
                mainModelBlock(_arry);
            }
            
        }
    }];
}

-(NSArray *)arry {
    if (_arry == nil) {
        _arry = [NSArray array];
    }
    return _arry;
}


@end
