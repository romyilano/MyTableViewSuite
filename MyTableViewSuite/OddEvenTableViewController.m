//
//  OddEvenTableViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "OddEvenTableViewController.h"
#import "MyTableViewSuiteManager.h"
#import "OddCell.h"
#import "EvenCell.h"

@interface OddEvenTableViewController ()
@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) NSMutableArray *phraseData;
@end

@implementation OddEvenTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableData = [[NSMutableArray alloc] init];
    self.phraseData = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[MyTableViewSuiteManager sharedManager] fetchRandomWordData:^(NSArray *phraseData, NSArray *tableData) {
        self.phraseData = [phraseData copy];
        self.tableData = [tableData copy];
        [self.tableView reloadData];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.phraseData = nil;
    self.tableData = nil;
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
    return self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    BOOL isEvenRow = (indexPath.row % 2 == 0);
    
    NSString *cellTitle = self.tableData[indexPath.row];
    NSString *cellPhraseContent = self.phraseData[indexPath.row];
    NSString *cellIdentifier = nil;
    
    if (isEvenRow) {
        cellIdentifier = @"EvenCell";
        EvenCell *evenCell = (EvenCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!evenCell) {
            evenCell = [[EvenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        evenCell.cellTitleLabel.text = cellTitle;
        evenCell.mainContentLabel.text = cellPhraseContent;
        evenCell.otherContentLabel.text = [NSString stringWithFormat:@"%@", [NSDate date]];
        evenCell.iconView.image = [UIImage imageNamed:@"star"];
        
        return evenCell;
    }
    
    cellPhraseContent = @"OddCell";
    OddCell *oddCell = (OddCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!oddCell) {
        oddCell = [[OddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    oddCell.cellTitleLabel.text = cellTitle;
    oddCell.cellContentLabel.text = cellPhraseContent;
    oddCell.iconView.image = [UIImage imageNamed:@"planet"];
    
    return oddCell;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        // Even row
        return 50;
    }
    
    // Odd row
    return 70;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
