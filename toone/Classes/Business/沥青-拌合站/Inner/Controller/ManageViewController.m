//
//  ManageViewController.m
//  toone
//
//  Created by shtoone on 16/12/20.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "ManageViewController.h"
#import "NQ_BHZ_SCCX_Controller.h"
#import "ExcessiveViewController.h"
#import "MaterialViewController.h"

@interface ManageViewController ()
@property (nonatomic,strong) UIViewController *contro;

@end
@implementation ManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    默认初始化
    self.contro = [[NQ_BHZ_SCCX_Controller alloc] init];
    if ([self.contro isKindOfClass:[NQ_BHZ_SCCX_Controller class]]) {
        
        [self addChildViewController:self.contro];
        [self.view addSubview:self.contro.view];
    }
    
    [self loadData];
}

-(void)loadData {
    NSArray *array = [NSArray arrayWithObjects:@"生产查询",@"数据统计",@"待处置报警", nil];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]   initWithItems:array];
    
    segment.frame = CGRectMake(10, 20, self.view.frame.size.width-150, 30);
//    默认选择
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor whiteColor];
    UIFont *font = [UIFont boldSystemFontOfSize:13.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [segment setTitleTextAttributes:attributes
                               forState:UIControlStateNormal];
    
    
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segment;
    
    [self.view addSubview:segment];
}

-(void)change:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {     //生产查询
        [self.contro removeFromParentViewController];
        [self.contro.view removeFromSuperview];
        
        self.contro = [[NQ_BHZ_SCCX_Controller alloc] init];
        NQ_BHZ_SCCX_Controller *producVc =(NQ_BHZ_SCCX_Controller *) self.contro;
        
        [self addChildViewController:producVc];
        [self.view addSubview:producVc.view];
        
    }else if (sender.selectedSegmentIndex == 1){    //数据统计
        [self.contro removeFromParentViewController];
        [self.contro.view removeFromSuperview];
        
        self.contro = [[MaterialViewController alloc] init];
        MaterialViewController *materVc = (MaterialViewController *) self.contro;
        
        [self addChildViewController:materVc];
        [self.view addSubview:materVc.view];
        
    }else if (sender.selectedSegmentIndex == 2){    //待处置报警
        [self.contro removeFromParentViewController];
        [self.contro.view removeFromSuperview];
        
        self.contro = [[ExcessiveViewController alloc] init];
        ExcessiveViewController *excessVc = (ExcessiveViewController *) self.contro;
        
        [self addChildViewController:excessVc];
        [self.view addSubview:excessVc.view];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
