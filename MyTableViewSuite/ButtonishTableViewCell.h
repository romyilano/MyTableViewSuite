//
//  ButtonishTableViewCell.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonCellDelegate.h"

@interface ButtonishTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;
@property (weak, nonatomic) IBOutlet UIButton *cellButton;
@property (weak, nonatomic) id <ButtonCellDelegate> buttonCellDelegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

- (IBAction)btnPressed:(UIButton *)sender;

@end
