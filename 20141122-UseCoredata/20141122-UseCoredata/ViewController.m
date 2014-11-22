//
//  ViewController.m
//  20141122-UseCoredata
//
//  Created by 杜承玖 on 14/11/22.
//  Copyright (c) 2014年 redianying. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "AppDelegate.h"

#define kUserModelName @"User"
#define kUsername @"michaeldu"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate * app;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _app = [UIApplication sharedApplication].delegate;
    
    [self addUser];
    [self findUsers];
    
    [self updateUser];
    [self findUsers];
    
    [self deleteUser];
    [self findUsers];
    
}

/**
 添加一个用户
 */
- (void)addUser{
    User * user = [NSEntityDescription insertNewObjectForEntityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
    user.name = kUsername;
    user.age = @"24";
    [_app saveContext];
}

/**
 查询所有的用户
 */
- (void)findUsers{
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    NSEntityDescription * userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
    [request setEntity:userDescription];
    
    NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"users.count = %ld", users.count);
    for (User *user in users) {
        NSLog(@"user.name = %@ and age = %@", user.name, user.age);
    }
}

/**
 修改用户
 */
- (void)updateUser{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
    [request setEntity:userDescription];
    
    NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
    for (User *user in users) {
        if ([user.name isEqualToString:kUsername]) {
            user.age = @"23";
            break;
        }
    }
    [_app saveContext];
}

/**
 删除一个用户
 */
- (void)deleteUser{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
    [request setEntity:userDescription];
    
    NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
    for (User *user in users) {
        if ([user.name isEqualToString:kUsername]) {
            [_app.managedObjectContext deleteObject:user];
            break;
        }
    }
    [_app saveContext];
}

@end
