//
//  NibCellSampleTableViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "NibCellSampleTableViewController.h"
#import "NibTableViewCell.h"
#import "LoneNavWolf3ViewController.h"

@interface NibCellSampleTableViewController ()

@end

@implementation NibCellSampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NibTableViewCell"
                                               bundle:nil]
         forCellReuseIdentifier:@"CellIdentifier"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL isEvenRow = (indexPath.row %2 == 0);
    
    NibTableViewCell *cell = (NibTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];

    cell.nibLabel.text = [NSString stringWithFormat:@"Section: %ld, row %ld", indexPath.section, (long)(long)indexPath.row];
    
    
    cell.nibImageView.image = isEvenRow ? [UIImage imageNamed:@"baceIcon3x"] : [UIImage imageNamed:@"placeholderPNG"];

    return cell;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // remember this causes a crash because it causes an infinite cycle
   // NibTableViewCell *cell = (NibTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    //return 100.0;
    return [NibTableViewCell nibCellHeight];
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // LoneNavWolf3
   //   ButtonDetailViewController *bdvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ButtonDetailLoneWolf"];
    LoneNavWolf3ViewController *loneNavWolf3VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoneNavWolf3"];
    [self.navigationController presentViewController:loneNavWolf3VC animated:YES completion:nil];
}

@end
