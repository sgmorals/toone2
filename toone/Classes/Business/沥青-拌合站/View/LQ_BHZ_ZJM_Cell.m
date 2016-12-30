//
//  LQ_BHZ_ZJM_Cell.m
//  toone
//
//  Created by shtoone on 16/12/28.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "LQ_BHZ_ZJM_Cell.h"
#import "LQModel.h"

@interface LQ_BHZ_ZJM_Cell ()
@property (weak, nonatomic) IBOutlet UILabel *bdLabel;
@property (weak, nonatomic) IBOutlet UILabel *djLabel;
@property (weak, nonatomic) IBOutlet UILabel *cbpsLabel;
@property (weak, nonatomic) IBOutlet UILabel *cblLabel;
@property (weak, nonatomic) IBOutlet UILabel *czlLabel;

@property (weak, nonatomic) IBOutlet UILabel *zclLabel;
@property (weak, nonatomic) IBOutlet UILabel *zpsLabel;

@property (weak, nonatomic) IBOutlet UIView *bkView;

@end
@implementation LQ_BHZ_ZJM_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bkView.backgroundColor = [UIColor oldLaceColor];
}


-(void)setLqMoodel:(LQModel *)LqMoodel {
    _LqMoodel = LqMoodel;
//    self.bdLabel.text = LqMoodel.banhezhanminchen;
//    self.djLabel.text = LqMoodel.dengji;
//    self.cbpsLabel.text = LqMoodel.cbps;
//    self.cblLabel.text = LqMoodel.cblv;
//    self.czlLabel.text = LqMoodel.reallv;
    self.zclLabel.text = LqMoodel.changliang;
    self.zpsLabel.text = LqMoodel.panshu;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
