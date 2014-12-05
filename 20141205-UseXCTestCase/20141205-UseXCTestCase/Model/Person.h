//
//  Person.h
//  20141205-UseXCTestCase
//
//  Created by 杜承玖 on 14/12/5.
//  Copyright (c) 2014年 redianying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (id)personWithName:(NSString *)name age:(NSInteger)age;

/**
 *  姓名
 */
@property (nonatomic, strong) NSString * name;
/**
 *  年龄
 */
@property (nonatomic, assign) NSInteger age;
/**
 *  性别
 */
@property (nonatomic, assign) BOOL sex;

@end
