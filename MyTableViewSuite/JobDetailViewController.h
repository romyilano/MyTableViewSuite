//
//  JobDetailViewController.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BACEJob;
@interface JobDetailViewController : UIViewController

@property (strong, nonatomic) BACEJob *baceJob;
@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *jobButton;
- (IBAction)btnPressed:(UIButton *)sender;

@end
