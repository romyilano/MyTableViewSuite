//
//  MyTableViewSuiteNetwork.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTableViewSuiteNetwork : NSObject

- (void)fetchRottenTomatoesMovies:(void(^)(NSArray *movies, BOOL success, NSError *error))completionBlock;

@end
