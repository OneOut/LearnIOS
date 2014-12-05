//
//  PersonTests.m
//  20141205-UseXCTestCase
//
//  Created by 杜承玖 on 14/12/5.
//  Copyright (c) 2014年 redianying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

/**
 1.单元测试的目标：模型文件
 2.用处：不基于界面UI的情况下，保证模型类的逻辑正确
 3.测试用例文件名约定：以测试类起始，添加Tests结尾
 4.Assert-断言：预先判断是否符合某种条件，一旦不符合，程序中断
 5.单元测试中有一个术语：红灯-绿灯
 6.单元测试中同样运行NSLog
 
 严格要求：所有的类都必须要写单元测试
 
 断言的特点可以让程序员提前发现程序代码中的隐患！
 测试驱动开发
 
 平时的情景：
    先写类；在.h里面定义了方法；然后就可以写测试用例，测试用例是去假定一些边界情况，然后断言返回值是否正确
 
 在一个公司,一个项目组，两个人，一个人写程序，另外一个人写单元测试；相当于两个人竞争，一个人想尽办法测出对方 的bug，另外一个人尽量写出的代码让对方测不出bug；一段时间之后，调换角色，这样对提高能力非常快
 
 在真正开发中：例如在采集用户数据，要验证用户信息的完整性，示例中的年龄大于18，小于60在实际中不太可能发生，不过如果年龄是一个负值或者1000，这样就不对了，需要写测试用例
 
 方法：随机数生成，测试生成的随机数是否超界
 
 */

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 *  测试用户名
 */
- (void)testName {
    Person *p = [[Person alloc] init];
    
    //姓名长度不能为空，长度至少是3个字符
    p.name = @"abc";
    
    XCTAssertFalse(p.name==nil, @"用户名不能为空");
    XCTAssertTrue(p.name.length>=3, @"用户名至少3个字符");
}

/**
 *  测试年龄范围在18到60之间
 */
- (void)testAge {
    Person *p = [[Person alloc] init];
    
    //测试情况1.小于18岁的人不能使用某些功能->person.age >= 18
    //在单元测试中一定要有边界测试
    p.age = 17;
    XCTAssertTrue(p.age>=18, @"年龄应该大于或等于18");
    p.age = 18;
    XCTAssertTrue(p.age>=18, @"年龄应该大于或等于18");
    p.age = 19;
    XCTAssertTrue(p.age>=18, @"年龄应该大于或等于18");
    
    //测试情况2，大于60岁的人不能使用某些功能->person.age <= 60
    p.age = 61;
    XCTAssertTrue(p.age<=60, "年龄应该小于或等于60");
}

- (void)testClassMethod1 {
    Person *p = [Person personWithName:@"zhangsan" age:18];
    
    //测试实例出来的内容是不是预期的
    XCTAssertTrue([p.name isEqualToString:@"zhangsan"]);
    XCTAssertEqual(p.age, 18, @"年龄应该等于18");
    
    Person *p1 = [Person personWithName:@"lisi" age:17];
    
    //测试实例化出现的内容是否为预期的
    XCTAssertTrue([p1.name isEqualToString:@"lisi"]);
    XCTAssertEqual(p1.age, 18, @"年龄应该等于18");
}


@end
