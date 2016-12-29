//
//  LightweightData.m
//  toone
//
//  Created by 十国 on 16/11/21.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "UserDefaultsSetting.h"

@implementation UserDefaultsSetting
+(instancetype)shareSetting{
    return [[self alloc] init];
}


static UserDefaultsSetting * setting = nil;
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        setting = [super allocWithZone:zone];
        [setting getFromSandbox];
    });
    return setting;
}

-(void)getFromSandbox{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    setting.acount   = [defaults objectForKey:@"acountKey"];
    setting.password = [defaults objectForKey:@"passwordKey"];
    setting.departId = [defaults objectForKey:@"departIdKey"];
    setting.loginDepartId = [defaults objectForKey:@"loginDepartIdKey"];
    setting.departName = [defaults objectForKey:@"departNameKey"];
    setting.userRole = [defaults objectForKey:@"userRoleKey"];
    setting.login    = [defaults boolForKey:@"loginKey"];
    setting.enterApplication = [defaults boolForKey:@"enterApplicationKey"];
    setting.userPhoneNum = [defaults objectForKey:@"userPhoneNumKey"];
    setting.userFullName = [defaults objectForKey:@"userFullNameKey"];
    //项目选择
    setting.funtype = [defaults objectForKey:@"funtypeKey"];
    
    
    //权限
    setting.hntchaobiaoReal = [defaults boolForKey:@"hntchaobiaoRealKey"];
    setting.hntchaobiaoSp = [defaults boolForKey:@"hntchaobiaoSpKey"];
    setting.syschaobiaoReal = [defaults boolForKey:@"syschaobiaoRealKey"];
    
    
    //存储时间
    setting.startTime = [defaults objectForKey:@"startTimeKey"];
    setting.endTime   = [defaults objectForKey:@"endTimeKey"];
    
    
    //沥青超标等级
    setting.dengji = [defaults objectForKey:@"dengjiKey"];
    //沥青组织机构节点名称
    setting.LqDepartName = [defaults objectForKey:@"LqDepartNameKey"];
    //沥青组织机构id
    setting.LqDepartld = [defaults objectForKey:@"LqDepartldKey"];
    //    生产数据查询设备编号
    setting.shebeibianhao = [defaults objectForKey:@"shebeibianhaoKey"];
    setting.bianhao = [defaults objectForKey:@"bianhaoKey"];
    
    //监听筛选时间按钮
    setting.timeName = [defaults objectForKey:@"timeNameKey"];
    
}
-(void)saveToSandbox{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.acount forKey:@"acountKey"];
    [defaults setObject:self.password forKey:@"passwordKey"];
    [defaults setObject:self.departId forKey:@"departIdKey"];
    [defaults setObject:self.loginDepartId forKey:@"loginDepartIdKey"];
    [defaults setObject:self.departName forKey:@"departNameKey"];
    [defaults setObject:self.userRole forKey:@"userRoleKey"];
    [defaults setObject:self.userPhoneNum forKey:@"userPhoneNumKey"];
    [defaults setObject:self.userFullName forKey:@"userFullNameKey"];
    [defaults setBool:self.login            forKey:@"loginKey"];
    [defaults setBool:self.enterApplication forKey:@"enterApplicationKey"];
    //组织机构项目选择
    [defaults setObject:self.funtype forKey:@"funtypeKey"];
    
    //权限
    [defaults setBool:self.hntchaobiaoReal   forKey:@"hntchaobiaoRealKey"];
    [defaults setBool:self.hntchaobiaoSp     forKey:@"hntchaobiaoSpKey"];
    [defaults setBool:self.syschaobiaoReal   forKey:@"syschaobiaoRealKey"];
    
    //存储时间
    [defaults setBool:self.endTime     forKey:@"endTimeKey"];
    [defaults setBool:self.startTime   forKey:@"startTimeKey"];
    
    //
    //沥青超标等级
    [defaults setObject:self.dengji forKey:@"dengjiKey"];
    //沥青组织机构节点名称
    [defaults setObject:self.LqDepartName forKey:@"LqDepartNameKey"];
    //沥青组织机构id
    [defaults setObject:self.LqDepartld forKey:@"LqDepartldKey"];
    
    //生产数据查询设备编号
    [defaults setObject:self.shebeibianhao forKey:@"shebeibianhaoKey"];
    [defaults setObject:self.bianhao forKey:@"bianhaoKey"];
    
    //监听筛选时间按钮
    [defaults setObject:self.timeName forKey:@"timeNameKey"];
    [defaults synchronize];
}

@end
