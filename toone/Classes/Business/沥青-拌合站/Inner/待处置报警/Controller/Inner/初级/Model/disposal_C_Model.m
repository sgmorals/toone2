//
//  disposal_C_Model.m
//  toone
//
//  Created by shtoone on 16/12/30.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "disposal_C_Model.h"
#import "MyViewController.h"
#import "NetworkTool.h"

@implementation disposal_C_Model

//-(void)disposalBlock:(DisposalBlock_t)disposalBlock {
//    MyViewController *myVc = [[MyViewController alloc] init];
//    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
//    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
//    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
//    [UserDefaultsSetting shareSetting].dengji = [NSNumber numberWithInt:1];
//    
//    NSString *urlString = [NSString stringWithFormat:LQExcessive,[UserDefaultsSetting shareSetting].dengji,userGroupId,startTimeStamp,endTimeStamp];
//        __weak typeof(self)  weakSelf = self;
//    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
//        //        NSMutableArray * datas = [NSMutableArray array];
//        NSDictionary *dict = (NSDictionary *)result;
//        
//        if ([dict[@"success"] boolValue]) {
//            weakSelf.disModel = [disposal_C_Model modelWithDict:dict[@"Fields"]];
//            if (disposalBlock) {
//                disposalBlock(weakSelf.disModel);
//            }
//        }
//    }
//     ];
//}
-(void)reloadData:(NSDictionary*)dict{
//    [self loadData:dict];
}
@end
