//
//  MyTableViewSuiteManager.m
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

#import "MyTableViewSuiteManager.h"
#import "MyTableViewSuiteNetwork.h"
#import "BACEJob.h"

@interface MyTableViewSuiteManager()

@property (strong, nonatomic) MyTableViewSuiteNetwork *networkManager;

@end

@implementation MyTableViewSuiteManager

// singleton
+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
        
    });
    return _sharedManager;
}

- (id)init {
    if (self = [super init]) {
        self.networkManager = [[MyTableViewSuiteNetwork alloc] init];
    }
    return self;
}

- (void)fetchRandomWordData:(void (^)(NSArray *, NSArray *))completionBlock {
    
    NSMutableArray *phraseData = [[NSMutableArray alloc] init];
    NSMutableArray *tableData = [[NSMutableArray alloc] init];
    
    NSArray *adjectiveWords = @[@"Fun", @"Enchanting", @"Intriguing", @"Exciting", @"Wholesome", @"Zesty", @"Delicious", @"Obscure"];
    NSArray *nounWords = @[@"People", @"Woman", @"Man", @"Child", @"Toy", @"Cat", @"Dog", @"Mystery", @"EcoProduct", @"Urbanization"];
    
    for (NSInteger i = 0; i < 50; i++) {
        int firstWord = arc4random_uniform(7) + 1;
        int secondWord = arc4random_uniform(9) + 1;
        int thirdWord = arc4random_uniform(9) + 1;
        
        [phraseData addObject:[NSString stringWithFormat:@"%@ %@ %@",
                                    adjectiveWords[firstWord],
                                    nounWords[secondWord],
                                    nounWords[thirdWord]]];
        
        [tableData addObject:[NSString stringWithFormat:@"Cell %ld", (long)i]];
    }
    
    if (completionBlock) {
        completionBlock(phraseData, tableData);
    }
}

- (void)fetchBabyNameArrayWithIndexArray:(void (^)(NSArray *, NSArray *))completionBlock {
    
    NSArray *tableData = @[@"Aaron", @"Allen",  @"Bailey", @"Cadan", @"Dafydd", @"Eamonn", @"Eyal", @"Fabian", @"Gabrielle", @"Hayako", @"Hafwen", @"Isaac", @"Jacinta", @"Kathleen", @"Lucy", @"Mimi", @"Melanie", @"Maurice", @"Nadia", @"Octavia", @"Padraig", @"Quinta", @"Rachel", @"Sabina", @"Tabitha", @"Tony", @"Uma", @"Valentina", @"Vivian", @"Wallis", @"Xanthe", @"Yvonne", @"Zebediah"];
    
    NSString *letters = @"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";
    NSArray *indexTitlesArray = [letters componentsSeparatedByString:@" "];
    
    if (completionBlock) {
        completionBlock(tableData, indexTitlesArray);
    }
}

- (void)fetchBaceJobRequestsDummyFile:(NSString *)fileName withCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    
    NSArray *finalArray = @[];
    NSError *error;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName
                                                         ofType:@"json"];
    NSData *jsonData = nil;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        jsonData = [[NSFileManager defaultManager] contentsAtPath:filePath];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSUTF8StringEncoding error:&error];
        if (jsonDict[@"requests"] && [jsonDict[@"requests"] isKindOfClass:[NSArray class]]) {
            NSMutableArray *workingArray = [[NSMutableArray alloc] init];
            for (NSDictionary *jobJsonDict in jsonDict[@"requests"]) {
                if ([jobJsonDict isKindOfClass:[NSDictionary class]]) {
                    BACEJob *baceJob = [[BACEJob alloc] initWithJsonDict:jobJsonDict];
                    [workingArray addObject:baceJob];
                }
            }
            finalArray = [workingArray copy];

        } else {
            error = [[NSError alloc] initWithDomain:@"com.snowyla" code:0 userInfo:@{ NSLocalizedDescriptionKey: @"bad json formatting"}];
        }
    } else {
        error = [[NSError alloc] initWithDomain:@"com.snowyla" code:0 userInfo:@{ NSLocalizedDescriptionKey: @"no json file"}];
    }
    if (completionBlock) {
        completionBlock(finalArray, error);
    }
}

@end
