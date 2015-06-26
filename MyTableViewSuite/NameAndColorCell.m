//
//  NameAndColorCell.m
//  Table Cells
//
//  Created by Kim Topley on 10/5/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *colorLabel;

@end

@implementation NameAndColorCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
    self.colorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)n {
    if (![n isEqualToString:_name]) {
        _name = [n copy];
        self.nameLabel.text = _name;
    }
}

- (void)setColor:(NSString *)c {
    if (![c isEqualToString:_color]) {
        _color = [c copy];
        self.colorLabel.text = _color;
    }
}

@end
