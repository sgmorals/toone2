//
//  MaterialViewController.m
//  toone
//
//  Created by shtoone on 16/12/20.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "MaterialViewController.h"
#import "XFSegementView.h"
#import "TemperatureViewController.h"
#import "MonitoringViewController.h"
#import "StatisticalTableViewController.h"

@interface MaterialViewController ()<TouchLabelDelegate>
{
    XFSegementView *segementView;
}
@property (nonatomic, strong) UIViewController *controVc;

@end
@implementation MaterialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    初始化分页
    self.controVc = [[TemperatureViewController alloc] init];
    if ([self.controVc isKindOfClass:[TemperatureViewController class]]) {
        
        [self addChildViewController:self.controVc];
        [self.view addSubview:self.controVc.view];
    }

    [self setSegement];
}

-(void)setSegement {
    segementView = [[XFSegementView alloc]initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 30)];
    //        [segementView setBackgroundColor:[UIColor cyanColor]];
    
    segementView.titleArray = @[@"出料口温度",@"生产监控",@"总产量统计"];
    
    [segementView.scrollLine setBackgroundColor:[UIColor greenColor]];
    segementView.titleSelectedColor = [UIColor redColor];
    
    segementView.touchDelegate = self;
    //    segementView.haveRightLine = NO;
    [self.view addSubview:segementView];
    
}

- (void)touchLabelWithIndex:(NSInteger)index{
    if (index == 0) { //出料口温度
        [self.controVc removeFromParentViewController];
        [self.controVc.view removeFromSuperview];
        
        self.controVc = [[TemperatureViewController alloc] init];
        
        TemperatureViewController *temperVc =(TemperatureViewController *) self.controVc;
        
        [self addChildViewController:temperVc];
        [self.view addSubview:temperVc.view];
        [self.view addSubview:segementView];
        
    }else if (index == 1) { //生产监控
        [self.controVc removeFromParentViewController];
        [self.controVc.view removeFromSuperview];
        
        self.controVc = [[MonitoringViewController alloc] init];
        
        MonitoringViewController *monitVc =(MonitoringViewController *) self.controVc;
        
        [self addChildViewController:monitVc];
        [self.view addSubview:monitVc.view];
        [self.view addSubview:segementView];
        
    }else if (index == 2) { //总产量统计
        [self.controVc removeFromParentViewController];
        [self.controVc.view removeFromSuperview];
        
        self.controVc = [[StatisticalTableViewController alloc] init];
        
        StatisticalTableViewController *statistVc =(StatisticalTableViewController *) self.controVc;
        
        [self addChildViewController:statistVc];
        [self.view addSubview:statistVc.view];
        [self.view addSubview:segementView];
        
    }
    
}





@end
