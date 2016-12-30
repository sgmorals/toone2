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


/**********************************/
#import "MySegmentedControl.h"
@interface ManageViewController ()
@property (nonatomic,strong) UIViewController *indexVc;
@property (nonatomic,assign) int index;
@end
@implementation ManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//sg .add
    //    默认初始化
    self.index =1;

    self.indexVc = [[NQ_BHZ_SCCX_Controller alloc] init];
    NQ_BHZ_SCCX_Controller *producVc =(NQ_BHZ_SCCX_Controller *) self.indexVc;
    
    [self addChildViewController:producVc];
    [self.view addSubview:producVc.view];

    
    [self loadUI];
//sg.add
}
-(void)loadUI{
    MySegmentedControl * seg = [[NSBundle mainBundle] loadNibNamed:@"MySegmentedControl" owner:nil options:nil][0];
    seg.frame = CGRectMake(0, 0, 220, 24);
    self.navigationItem.titleView = seg;
    [seg switchToLQBHZ];
    __weak typeof(self) weakSelf = self;
    seg.segBlock = ^(int tag){
        switch (tag) {
            case 1:{//生产查询
                if (weakSelf.index !=1){
                    [self.indexVc removeFromParentViewController];
                    [self.indexVc.view removeFromSuperview];
                    
                    self.indexVc = [[NQ_BHZ_SCCX_Controller alloc] init];
                    NQ_BHZ_SCCX_Controller *producVc =(NQ_BHZ_SCCX_Controller *) self.indexVc;
                    
                    [self addChildViewController:producVc];
                    [self.view addSubview:producVc.view];
                    weakSelf.index = 1;
                }
                break;
            }
            case 2:{
                //数据统计
                if (weakSelf.index != 2){
                    [self.indexVc removeFromParentViewController];
                    [self.indexVc.view removeFromSuperview];
                    
                    self.indexVc = [[MaterialViewController alloc] init];
                    MaterialViewController *materVc = (MaterialViewController *) self.indexVc;
                    
                    [self addChildViewController:materVc];
                    [self.view addSubview:materVc.view];
                    weakSelf.index = 2;
                }
                break;
            }
            case 3:{
                //待处置报警
                if (weakSelf.index != 3){
                    [self.indexVc removeFromParentViewController];
                    [self.indexVc.view removeFromSuperview];
                    
                    self.indexVc = [[ExcessiveViewController alloc] init];
                    ExcessiveViewController *excessVc = (ExcessiveViewController *) self.indexVc;
                    
                    [self addChildViewController:excessVc];
                    [self.view addSubview:excessVc.view];
                    weakSelf.index = 3;
                }
                break;
            }
        }
    };
}
//
//-(void)systemfunc{
//    //    默认初始化
//    self.indexVc = [[NQ_BHZ_SCCX_Controller alloc] init];
//    if ([self.indexVc isKindOfClass:[NQ_BHZ_SCCX_Controller class]]) {
//        
//        [self addChildViewController:self.indexVc];
//        [self.view addSubview:self.indexVc.view];
//    }
//    
//    [self loadData];
//}
//
//-(void)loadData {
//    NSArray *array = [NSArray arrayWithObjects:@"生产查询",@"数据统计",@"待处置报警", nil];
//    
//    UISegmentedControl *segment = [[UISegmentedControl alloc]   initWithItems:array];
//    
//    segment.frame = CGRectMake(15, 20, self.view.frame.size.width-85, 25);
////    默认选择
//    segment.selectedSegmentIndex = 0;
//    segment.tintColor = [UIColor whiteColor];
//    UIFont *font = [UIFont boldSystemFontOfSize:11.0f];
//    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
//                                                           forKey:UITextAttributeFont];
//    [segment setTitleTextAttributes:attributes
//                               forState:UIControlStateNormal];
//    
//    
//    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
//    
//    self.navigationItem.titleView = segment;
//    
//    [self.view addSubview:segment];
//}
//
//-(void)change:(UISegmentedControl *)sender {
//    if (sender.selectedSegmentIndex == 0) {     //生产查询
//        [self.indexVc removeFromParentViewController];
//        [self.indexVc.view removeFromSuperview];
//        
//        self.indexVc = [[NQ_BHZ_SCCX_Controller alloc] init];
//        NQ_BHZ_SCCX_Controller *producVc =(NQ_BHZ_SCCX_Controller *) self.indexVc;
//        
//        [self addChildViewController:producVc];
//        [self.view addSubview:producVc.view];
//        
//    }else if (sender.selectedSegmentIndex == 1){    //数据统计
//        [self.indexVc removeFromParentViewController];
//        [self.indexVc.view removeFromSuperview];
//        
//        self.indexVc = [[MaterialViewController alloc] init];
//        MaterialViewController *materVc = (MaterialViewController *) self.indexVc;
//        
//        [self addChildViewController:materVc];
//        [self.view addSubview:materVc.view];
//        
//    }else if (sender.selectedSegmentIndex == 2){    //待处置报警
//        [self.indexVc removeFromParentViewController];
//        [self.indexVc.view removeFromSuperview];
//        
//        self.indexVc = [[ExcessiveViewController alloc] init];
//        ExcessiveViewController *excessVc = (ExcessiveViewController *) self.indexVc;
//        
//        [self addChildViewController:excessVc];
//        [self.view addSubview:excessVc.view];
//        
//    }
//}





@end
