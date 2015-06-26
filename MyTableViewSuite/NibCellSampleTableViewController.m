//
//  NibCellSampleTableViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "NibCellSampleTableViewController.h"
#import "NibTableViewCell.h"

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


@end
