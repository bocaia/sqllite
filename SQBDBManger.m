







//
//  SQBDBManger.m
//  sqllite
//
//  Created by laitang on 2017/3/2.
//  Copyright © 2017年 laitang. All rights reserved.
//

#import "SQBDBManger.h"
#import "SQBCountModel.h"
#import "FMDB.h"

//  获取沙箱文件
#define GetFileInAppData(file) [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/AppData/%@",file]]

@interface SQBDBManger()

@property(nonatomic,strong) FMDatabaseQueue         *dbQueue;

@end


@implementation SQBDBManger

+ (SQBDBManger *)shareManger{
    static SQBDBManger *shareMangerInstence = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        shareMangerInstence = [[self alloc] init];
    });
    return shareMangerInstence;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDatabase];
    }
    return self;
}

- (void)setupDatabase
{
    //  检查沙箱目录文件是否存在，如果不存在则将资源目录文件复制过去
    NSString *bundleDB = [[NSBundle mainBundle] pathForResource:@"Untitled" ofType:@"db"];
    NSString *sandboxDB = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Untitled.db"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:sandboxDB]) {
        [[NSFileManager defaultManager] copyItemAtPath:bundleDB toPath:sandboxDB error:nil];
    }
    self.dbQueue = [[FMDatabaseQueue alloc] initWithPath:sandboxDB];
}



- (NSArray *)NationModelArray
{
    NSString *sql = @"select * FROM sys_code where parent_code_id = '4526'";
    __block NSMutableArray *array = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        while (rs.next) {
            SQBCountModel *mdoel = [[SQBCountModel alloc] initWithDictionary:rs.resultDictionary];
            [array addObject:mdoel];
        }
    }];
    return array;
}

- (NSArray *)CountriesModelArray
{
    NSString *sql = @"select * FROM sys_code where parent_code_id = '4525'";
    __block NSMutableArray *array = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        while (rs.next) {
            SQBCountModel *mdoel = [[SQBCountModel alloc] initWithDictionary:rs.resultDictionary];
            [array addObject:mdoel];
        }
    }];
    return array;
}
- (NSArray *)CountsModelArray
{
    NSString *sql = @"select * FROM sys_code where parent_code_id = '1' and ";
    __block NSMutableArray *array = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        while (rs.next) {
            SQBCountModel *mdoel = [[SQBCountModel alloc] initWithDictionary:rs.resultDictionary];
            [array addObject:mdoel];
        }
    }];
    return array;
}


@end
