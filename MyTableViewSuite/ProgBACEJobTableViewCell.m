//
//  ProgBACEJobTableViewCell.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "ProgBACEJobTableViewCell.h"

@implementation ProgBACEJobTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
    self.jobTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0];
    self.jobDescriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    self.jobDescriptionLabel.numberOfLines = 0;
    self.jobDescriptionLabel.textAlignment = NSTextAlignmentLeft;
    self.jobImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)invisibleBtnTapped:(UIButton *)sender {
    // use a block
}

@end
