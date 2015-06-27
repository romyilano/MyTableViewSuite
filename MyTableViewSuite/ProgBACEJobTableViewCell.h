//
//  ProgBACEJobTableViewCell.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgBACEJobTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jobImageView;

// this can also be a tapgesturerecognizer
@property (weak, nonatomic) IBOutlet UIButton *invisibleButton;

- (IBAction)invisibleBtnTapped:(UIButton *)sender;

@end
