//
//  SQBDBManger.h
//  sqllite
//
//  Created by laitang on 2017/3/2.
//  Copyright © 2017年 laitang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQBDBManger : NSObject
+ (SQBDBManger *)shareManger;

/*
 国家
 */
- (NSArray *)CountriesModelArray;

/*
 民族
 */
- (NSArray *)NationModelArray;
- (NSArray *)CountsModelArray;
@end
