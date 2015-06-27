//
//  ProgViewController.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "ProgViewController.h"
#import "MyTableViewSuiteManager.h"
#import "ProgBACEJobTableViewCell.h"
#import "BACEJob.h"

static NSString *JobCellIdentifier = @"JobCellIdentifier";

@interface ProgViewController ()
@property (strong, nonatomic) NSMutableArray *tableDataArray;
@end

@implementation ProgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.theTableView = [[UITableView alloc] init];
    self.theTableView.frame = self.view.frame;
    self.theTableView.delegate = self;
    self.theTableView.dataSource = self;
    [self.view addSubview:self.theTableView];
    
    [self.theTableView registerNib:[UINib nibWithNibName:@"ProgBACEJobTableViewCell" bundle:nil]
         forCellReuseIdentifier:JobCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.tableDataArray = [[NSMutableArray alloc] init];
    
    [[MyTableViewSuiteManager sharedManager] fetchBaceJobRequestsDummyFile:@"bace_job_requests1" withCompletionBlock:^(NSArray *jobsRequests, NSError *error) {
        if (!error) {
            if (jobsRequests.count > 0) {
                for (NSDictionary *jobJsonDict in jobsRequests) {
                    if ([jobJsonDict isKindOfClass:[NSDictionary class]]) {
                        BACEJob *baceJob = [[BACEJob alloc] initWithJsonDict:jobJsonDict];
                        [self.tableDataArray addObject:baceJob];
                    }
                }
            }
            
            [self.theTableView reloadData];
        } else {
            NSLog(@"There was an error: %@", error);
        }
    }];
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
    return self.tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ProgBACEJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobCellIdentifier];
    
    BACEJob *baceJob = self.tableDataArray[indexPath.row];
    
    if (cell == nil) {
        cell = [[ProgBACEJobTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   //  cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", baceJob.jobName, baceJob.jobDescription];
    cell.jobTitleLabel.text = baceJob.jobName;
    cell.jobDescriptionLabel.text = baceJob.jobDescription;
    cell.jobImageView.image = [UIImage imageNamed:@"Planet"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 120.0;
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
