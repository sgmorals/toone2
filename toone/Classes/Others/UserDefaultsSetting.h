//
//  LightweightData.h
//  toone
//
//  Created by 十国 on 16/11/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  存储登录信息
 */
@interface UserDefaultsSetting : NSObject
+(instancetype)shareSetting;

@property (nonatomic,copy) NSString * acount;
@property (nonatomic,copy) NSString * password;
@property (nonatomic,copy) NSString * loginDepartId;
@property (nonatomic,copy) NSString * departId;
@property (nonatomic,copy) NSString * departName;
@property (nonatomic,copy) NSString * userRole;
@property (nonatomic,copy) NSString * userPhoneNum;
@property (nonatomic,copy) NSString * userFullName;
@property (nonatomic, strong) NSNumber *funtype;


@property (nonatomic,assign,getter=isLogin) BOOL  login;
@property (nonatomic,assign,getter=isEnterApplication) BOOL enterApplication;

//保存到沙盒
-(void)saveToSandbox;

//权限
@property (nonatomic,assign) BOOL  hntchaobiaoReal;
@property (nonatomic,assign) BOOL  hntchaobiaoSp;
@property (nonatomic,assign) BOOL  syschaobiaoReal;


//存储开始时间和结束时间
@property (nonatomic,copy) NSString * startTime;
@property (nonatomic,copy) NSString * endTime;


//
@property (nonatomic, copy) NSString *LqDepartld;//沥青组织机构id
@property (nonatomic, copy) NSString *LqDepartName;//沥青组织机构节点名称
@property (nonatomic, strong) NSNumber *dengji;// 沥青超标等级
@property (nonatomic, copy) NSString *shebeibianhao;//设备编号(生产数据查询）
@property (nonatomic, strong) NSNumber *bianhao;//编号(生产数据查询）
@property (nonatomic, copy) NSString *timeName;//监听筛选时间按钮
@property (nonatomic, strong) NSNumber *dailyid;//日产量id
@property (nonatomic, copy) NSString *dailysbbh;//日产量设备编号
@end
