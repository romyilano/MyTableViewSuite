//
//  NibTableViewCell.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "NibTableViewCell.h"

@implementation NibTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.nibLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)nibCellHeight {
    CGFloat topMargin = 10.0;
    CGFloat bottomMargin = 10.0;
    
    CGFloat imageHeight = 80.0;
    
    return topMargin + imageHeight + bottomMargin;
}

@end
