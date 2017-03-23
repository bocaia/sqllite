//
//  ViewController.m
//  sqllite
//
//  Created by laitang on 2017/3/1.
//  Copyright © 2017年 laitang. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
#import "SQBCountModel.h"
#import "SQBDBManger.h"
//  获取沙箱文件
#define GetFileInAppData(file) [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/AppData/%@",file]]

@interface ViewController ()
@property(nonatomic,strong) FMDatabaseQueue         *dbQueue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createsql];
}


- (void)createsql{
     NSArray *countresArray = [[SQBDBManger shareManger] CountriesModelArray];
     NSArray *nationArray = [[SQBDBManger shareManger] NationModelArray];
    NSLog(@"%@",[[SQBDBManger shareManger]CountsModelArray]);
    for (SQBCountModel *model in [[SQBDBManger shareManger]CountsModelArray]) {
        NSLog(@"%@",model.txt);
    }
    int i = 0;
    for (SQBCountModel *model in nationArray) {
//        NSLog(@"%@",model.txt);
        i++;
//        NSLog(@"%d",i);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
