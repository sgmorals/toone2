//
//  LQModel.h
//  toone
//
//  Created by shtoone on 16/12/19.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^MainModelBlock)(NSArray *result);

@interface LQModel : NSObject
//初级
@property (nonatomic, copy) NSString *banhezhanminchen;//拌合站名称
@property (nonatomic, copy) NSString *cblv;//超标率
@property (nonatomic, copy) NSString *cbps;//超标盘数
@property (nonatomic, copy) NSString *dengji;//超标等级
@property (nonatomic, copy) NSString *reallv; //处置率

//中级
//@property (nonatomic, copy) NSString *banhezhanminchenMiddle;//拌合站名称
//@property (nonatomic, copy) NSString *cblvMiddle;//超标率
//@property (nonatomic, copy) NSString *cbpsMiddle;//超标盘数
//@property (nonatomic, copy) NSString *dengjiMiddle;//超标等级
//@property (nonatomic, copy) NSString *reallvMiddle; //处置率
//
////高级
//@property (nonatomic, copy) NSString *banhezhanminchenSenior;//拌合站名称
//@property (nonatomic, copy) NSString *cblvSenior;//超标率
//@property (nonatomic, copy) NSString *cbpsSenior;//超标盘数
//@property (nonatomic, copy) NSString *dengjiSenior;//超标等级
//@property (nonatomic, copy) NSString *reallvSenior; //处置率
//
////总
//@property (nonatomic, copy) NSString *banhezhanminchenZong;//拌合站名称
//@property (nonatomic, copy) NSString *cblvZong;//超标率
//@property (nonatomic, copy) NSString *cbpsZong;//超标盘数
//@property (nonatomic, copy) NSString *dengjiZong;//超标等级
//@property (nonatomic, copy) NSString *reallvZong; //处置率


@property (nonatomic, copy) NSString *shebeibianhao; //设备编号
@property (nonatomic, copy) NSString *bhjCount; //拌合机总数
@property (nonatomic, copy) NSString *bhzCount; //拌合站总数

@property (nonatomic, copy) NSString *panshu;//总盘数
@property (nonatomic, copy) NSString *changliang;//总产量
@property (nonatomic, copy) NSString *deptId;//组织机构ID
@property (nonatomic, copy) NSString *deptName;//组织机构名称

@property (nonatomic, strong) NSArray *arry;

-(void)mainModelBlock:(MainModelBlock)mainModelBlock;

@end
