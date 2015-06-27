//
//  ButtonCellTableViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "ButtonCellTableViewController.h"
#import "MyTableViewSuiteManager.h"
#import "ButtonishTableViewCell.h"
#import "ButtonDetailViewController.h"

static NSString *CellIdentifier = @"CellIdentifier";
static NSString *ButtonishCellIdentifier = @"ButtonishCellIdentifier";

@interface ButtonCellTableViewController ()
@property (strong, nonatomic) NSArray *phraseData;
@end

@implementation ButtonCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phraseData = [[NSArray alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ButtonishTableViewCell" bundle:nil]
         forCellReuseIdentifier:ButtonishCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[MyTableViewSuiteManager sharedManager] fetchRandomWordData:^(NSArray *phraseData, NSArray *tableData) {
        self.phraseData = phraseData;
        NSLog(@"phrase data : %@", self.phraseData);
        [self.tableView reloadData];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.phraseData = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.phraseData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ButtonishTableViewCell *buttonishTableViewCell = (ButtonishTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ButtonishCellIdentifier];
    if (buttonishTableViewCell == nil) {
        buttonishTableViewCell = [[ButtonishTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ButtonishCellIdentifier];
    }
    buttonishTableViewCell.buttonLabel.text = self.phraseData[indexPath.row];
    buttonishTableViewCell.cellButton.titleLabel.text = @"Hi";
    buttonishTableViewCell.indexPath = indexPath;
    buttonishTableViewCell.buttonCellDelegate = self;
    return buttonishTableViewCell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // important! instantiating a vc in storyboard
    ButtonDetailViewController *bdvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ButtonDetailLoneWolf"];
    bdvc.detailCopy = [NSString stringWithFormat:@"Section: %lu Row: %lu \n%@",
                       (long)indexPath.section,
                       (long)indexPath.row,
                       self.phraseData[indexPath.row]];
    
    [self.navigationController pushViewController:bdvc animated:YES];
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 70.0;
}

#pragma mark - Button Cell Delegate

- (void)didClickOnCellAtIndex:(NSIndexPath *)indexPath {
    NSLog(@"Tapped on the button cell");
    
    ButtonDetailViewController *buttonDetailVC = [[ButtonDetailViewController alloc] initWithNibName:@"ButtonDetailViewController" bundle:nil];
    [self.navigationController pushViewController:buttonDetailVC animated:YES];
}

- (void)didClickOnCellAtIndex:(NSIndexPath *)indexPath withLabelStringData:(NSString *)labelString {
    ButtonDetailViewController *buttonDetailVC = [[ButtonDetailViewController alloc] initWithNibName:@"ButtonDetailViewController" bundle:nil];
    buttonDetailVC.detailCopy = labelString;
    [self.navigationController pushViewController:buttonDetailVC animated:YES];
}

@end
