//
//  LQ_BHZ_SB_Controller.h
//  toone
//
//  Created by shtoone on 16/12/28.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SB_Data_t)(NSString *str);

@interface LQ_BHZ_SB_Controller : UITableViewController
@property (copy, nonatomic) SB_Data_t SB_Data;

@end
