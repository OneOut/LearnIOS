//
//  Person.m
//  20141205-UseXCTestCase
//
//  Created by 杜承玖 on 14/12/5.
//  Copyright (c) 2014年 redianying. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)personWithName:(NSString *)name age:(NSInteger)age {
    Person *p = [[Person alloc] init];
    
    p.name = name;
    p.age = age;
    
    return p;
}

- (void)setAge:(NSInteger)age {
    _age = age;
    
    if ( _age<=18 ) {
        _age = 18;
    } else if ( _age>60 ) {
        _age = 60;
    }
}

@end
