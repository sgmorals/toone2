//
//  Lq_ZJM_Cell.m
//  toone
//
//  Created by shtoone on 16/12/28.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "Lq_ZJM_Cell.h"
#import "LQModel.h"

@interface Lq_ZJM_Cell ()
@property (weak, nonatomic) IBOutlet UILabel *bdLabel;
@property (weak, nonatomic) IBOutlet UILabel *djLabel;
@property (weak, nonatomic) IBOutlet UILabel *cbpsLabel;
@property (weak, nonatomic) IBOutlet UILabel *cblLabel;
@property (weak, nonatomic) IBOutlet UILabel *czlLabel;



@end
@implementation Lq_ZJM_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LQModel *)model {
    model = model;
    self.bdLabel.text = model.banhezhanminchen;
    self.djLabel.text = model.dengji;
    self.cbpsLabel.text = model.cbps;
    self.cblLabel.text = [NSString stringWithFormat:@"%@%%",model.cblv];
    self.czlLabel.text = [NSString stringWithFormat:@"%@%%",model.reallv];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
