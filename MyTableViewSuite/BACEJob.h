//
//  BACEJob.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BACEJobSeverityLevel) {
    BACEJobSeverityLevelLow,
    BACEJobSeverityLevelMedium,
    BACEJobSeverityLevelHigh
};

@interface BACEJob : NSObject

@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSString *jobName;
@property (strong, nonatomic) NSString *jobDescription;
@property (strong, nonatomic) NSNumber *hoursOffered;
@property (strong, nonatomic) NSNumber *idNumber;
@property (strong, nonatomic) NSString *severityString;
@property (strong, nonatomic) NSString *createdAtString;
@property (strong, nonatomic) NSString *updatedAtString;

/*
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSDate *updatedAt;
@property (assign, nonatomic) BACEJobSeverityLevel severity;
 */

- (instancetype)initWithJsonDict:(NSDictionary *)jsonDict;
/*
- (NSDate *)createdAt;
- (NSDate *)updatedAt;
- (BACEJobSeverityLevel)severity;
*/

@end
