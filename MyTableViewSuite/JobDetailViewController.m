//
//  JobDetailViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "JobDetailViewController.h"
#import "JobImageViewController.h"
#import "BACEJob.h"

@interface JobDetailViewController ()

@end

@implementation JobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.jobDescriptionLabel.numberOfLines = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.jobNameLabel.text = self.baceJob.jobName;
    self.jobDescriptionLabel.text = self.baceJob.jobDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action Methods
- (IBAction)btnPressed:(UIButton *)sender {
  
    JobImageViewController *jobImageViewController = [[JobImageViewController alloc] init];
    jobImageViewController.theImage = [UIImage imageNamed:@"kombucha-dark"];
    [self.navigationController pushViewController:jobImageViewController animated:YES];
}

@end
