//
//  EXPrimaryModel.m
//  toone
//
//  Created by shtoone on 16/12/23.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "EXPrimaryModel.h"
#import "YYModel.h"
#import "MyViewController.h"
#import "NetworkTool.h"

@implementation EXPrimaryModel

//-(void)exPrimaryBlock:(ExPrimaryBlock)exPrimaryBlock withString:(NSString *)urlString {
//    MyViewController *myVc = [[MyViewController alloc] init];
//    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
//    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
//    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
//    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:1];
//    NSString *chuzhileixing = @"";
//    NSString *shebStr = @"";
//    
//    if (urlString) {
//        chuzhileixing = urlString;
//    }
//
//    NSString *url = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,chuzhileixing,shebStr,userGroupId,startTimeStamp,endTimeStamp];
//    
////        __weak typeof(self)  weakSelf = self;
//    [[NetworkTool sharedNetworkTool] getObjectWithURLString:url completeBlock:^(id result) {
//        NSDictionary *dict = (NSDictionary *)result;
//        
////        数据展示
//        if ([dict[@"success"] boolValue]) {
//            
//            NSArray *dictArr = dict[@"data"];
//            NSArray *arry = [NSArray yy_modelArrayWithClass:[EXPrimaryModel class] json:dictArr];
//            _arry = [NSMutableArray arrayWithArray:arry];
//            
//            if (exPrimaryBlock) {
//                exPrimaryBlock(_arry);
//            }
//            
//        }
//    }];
//}
//
//-(NSMutableArray *)arry {
//    if (_arry == nil) {
//        _arry = [NSMutableArray array];
//    }
//    return _arry;
//}

@end
