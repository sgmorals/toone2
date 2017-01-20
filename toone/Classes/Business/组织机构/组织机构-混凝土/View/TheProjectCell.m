//
//  TheProjectCell.m
//  The Projects
//
//  Created by Ahmed Karim on 1/11/13.
//  Copyright (c) 2013 Ahmed Karim. All rights reserved.
//

#import "TheProjectCell.h"

@interface TheProjectCell()

@property (nonatomic) BOOL isExpanded;

@end

@implementation TheProjectCell

#pragma mark - Draw controls messages

- (void)drawRect:(CGRect)rect
{
    CGRect cellFrame = self.cellLabel.frame;
    CGRect buttonFrame = self.cellButton.frame;
    int indentation = self.treeNode.depth * 25;
    cellFrame.origin.x = buttonFrame.size.width + indentation + 5;
    buttonFrame.origin.x = 2 + indentation;
    self.cellLabel.frame = cellFrame;
    self.cellButton.frame = buttonFrame;
}

- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage
{
    [self.cellButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

@end
