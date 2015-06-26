//
//  ButtonishTableViewCell.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "ButtonishTableViewCell.h"

@implementation ButtonishTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.cellButton.titleLabel.text = @"Hi";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnPressed:(UIButton *)sender {
    if (self.buttonCellDelegate && [self.buttonCellDelegate conformsToProtocol:@protocol(ButtonCellDelegate)]) {
        [self.buttonCellDelegate didClickOnCellAtIndex:self.indexPath withLabelStringData:self.buttonLabel.text];
    }
}

@end
