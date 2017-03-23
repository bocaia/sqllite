//
//  SQBCountModel.h
//  sqllite
//
//  Created by laitang on 2017/3/2.
//  Copyright © 2017年 laitang. All rights reserved.
//

#import "Jastor.h"
//"code_id" = 4788;
//"code_status" = 1;
//corder = 1;
//desc = "";
//"parent_code_id" = 4526;
//"start_num" = 0;
//txt = "\U6c49\U65cf";
//"txt_color" = "";
//value = 01;

@interface SQBCountModel : Jastor
@property (strong,nonatomic) NSString *code_id;
@property (strong,nonatomic) NSString *code_status;
@property (strong,nonatomic) NSString *corder;
@property (strong,nonatomic) NSString *desc;
@property (strong,nonatomic) NSString *parent_code_id;
@property (strong,nonatomic) NSString *start_num;
@property (strong,nonatomic) NSString *txt;
@property (strong,nonatomic) NSString *txt_color;
@property (strong,nonatomic) NSString *value;

@end
