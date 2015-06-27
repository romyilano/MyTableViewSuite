//
//  BACEJob.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "BACEJob.h"

@implementation BACEJob

- (instancetype)initWithJsonDict:(NSDictionary *)jsonDict {
    if (self = [super init]) {
        if ([jsonDict isKindOfClass:[NSDictionary class]]) {
            
            _jobName = jsonDict[@"name"] ? jsonDict[@"name"] : @"";
            _jobDescription = jsonDict[@"description"] ? jsonDict[@"description"] : @{};
            _hoursOffered = jsonDict[@"hours_offered"] ? jsonDict[@"hours_offered"] : 0;
            _severityString = jsonDict[@"severity"] ? jsonDict[@"severity"] : nil;
            _createdAtString = jsonDict[@"created_at"] ? jsonDict[@"created_at"] : nil;
            _updatedAtString = jsonDict[@"updated_at"] ? jsonDict[@"updated_at"] : nil;
        }
    }
    return self;
}

@end
