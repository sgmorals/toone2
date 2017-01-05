//
//  ProduQueryModel.h
//  toone
//
//  Created by shtoone on 16/12/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ProduQueryBlock)(NSArray *result);

@interface ProduQueryModel : NSObject
@property (nonatomic, strong) NSNumber *bianhao;//编号
@property (nonatomic, strong) NSString *deptId; //组织机构id
@property (nonatomic, strong) NSString *shebeibianhao;//设备编号

@property (nonatomic, strong) NSString *clwd;//出料温度
@property (nonatomic, strong) NSString *shijian;//时间
@property (nonatomic, strong) NSString *sjlq;//沥青量
@property (nonatomic, strong) NSString *sjysb; //油石比

@property (nonatomic, strong) NSArray *arr;

-(void)produQueryBlock:(ProduQueryBlock)produQueryBlock;
@end
