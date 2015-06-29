//
//  MyTableViewSuiteNetwork.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "MyTableViewSuiteNetwork.h"

@implementation MyTableViewSuiteNetwork


// @"http://api.rottentomatoes.com/api/public/v1.0/

- (void)fetchRottenTomatoesMovies:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    NSURLSession *session = [NSURLSession sharedSession];
    [session dataTaskWithURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/"] completionHandler:^(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error) {
        // this should be on the background thread
    }];
}

@end
