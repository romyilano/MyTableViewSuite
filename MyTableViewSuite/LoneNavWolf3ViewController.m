//
//  LoneNavWolf3ViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/29/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "LoneNavWolf3ViewController.h"

@interface LoneNavWolf3ViewController ()

@end

@implementation LoneNavWolf3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Lone Wolf View Controller";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelBarBtnItemPressed:(UIBarButtonItem *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
