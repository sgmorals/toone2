//
//  ProduQueryModel.m
//  toone
//
//  Created by shtoone on 16/12/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "ProduQueryModel.h"
#import "YYModel.h"
#import "NetworkTool.h"
#import "MyViewController.h"

@implementation ProduQueryModel

-(void)produQueryBlock:(ProduQueryBlock)produQueryBlock {
    MyViewController *myVc = [[MyViewController alloc] init];
    NSString * startTimeStamp = [TimeTools timeStampWithTimeString:myVc.startTime];
    NSString * endTimeStamp = [TimeTools timeStampWithTimeString:myVc.endTime];
    NSString * userGroupId = [UserDefaultsSetting shareSetting].LqDepartld;
    
    NSString *urlString = [NSString stringWithFormat:ProduQuery,userGroupId,startTimeStamp,endTimeStamp];
    
//        __weak typeof(self)  weakSelf = self;
    [[NetworkTool sharedNetworkTool] getObjectWithURLString:urlString completeBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        
        if ([dict[@"success"]  boolValue]) {
            NSArray *arr = dict[@"data"];
            
            self.arr = [NSArray yy_modelArrayWithClass:[ProduQueryModel class] json:arr];
            
            if (produQueryBlock) {
                produQueryBlock(self.arr);
            }
        }
    }];

}

@end
