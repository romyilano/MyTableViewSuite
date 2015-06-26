//
//  MyTableViewSuiteManager.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTableViewSuiteManager : NSObject

+ (instancetype)sharedManager;

- (void)fetchRandomWordData:(void(^)(NSArray *phraseData, NSArray *tableData))completionBlock;

- (void)fetchBabyNameArrayWithIndexArray:(void(^)(NSArray *babyNameArray, NSArray *indexTitlesArray))completionBlock;

@end
